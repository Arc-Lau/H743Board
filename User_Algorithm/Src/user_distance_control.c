#include <stdint.h>
#include <string.h>

#include "../../Core/Inc/bsp.h"
#include "../../User_Algorithm/user_coord.h"
#include "../../Core/Inc/bsp_config.h"
#include "../../User_Algorithm/data_treating.h"
/* 函数体 --------------------------------------------------------------------*/
/**
* @brief 实时更新 Delta_Angle
* @param delta_angle_tick 滴答定时器每周期增加的角度
*/
void Delta_Angle_Update(const float delta_angle_tick) {
    user_distance_control.delta_angle += delta_angle_tick;
    if (user_distance_control.delta_angle >= 360) {
        user_distance_control.delta_angle -= 360;
    }
}

/**
* @brief 将索引限制在 360*PRECISION 内
* @param
*/
uint16_t index_regulating(uint16_t index_nr) {
    if (index_nr > 360*PRECISION_CIR ) index_nr -= 360*PRECISION_CIR;
    if (index_nr == 360*PRECISION_CIR) index_nr = 0;
    if (index_nr < 0) index_nr += 360*PRECISION_CIR;
    return index_nr;
}

/**
* @brief 将浮点索引限制在 360*PRECISION 内
* @param
* @note 主要用于 portion的计算，portion不会超过 10*360
*/
float index_f_regulating(float index_nr) {
    if (index_nr > 360.0f*PRECISION_CIR) index_nr -= 360.0f*PRECISION_CIR;
    if (index_nr < 0.0f) index_nr += 360.0f*PRECISION_CIR;
    return index_nr;
}


/**
* @brief 在每次stp23被回调后更新数组
* @param
*/
void Circle_Update(const uint16_t* distance,uint8_t stp_id,uint16_t initial_angle,float* delta_angle,float* delta_angle_old) {
    float index_f = *delta_angle * PRECISION_CIR + initial_angle * PRECISION_CIR;
    float index_old_f = delta_angle_old[stp_id] * PRECISION_CIR + initial_angle * PRECISION_CIR;
    float portion = index_f_regulating(index_f - index_old_f)/12;
    uint16_t index_head = (uint16_t) index_old_f;
//    uint16_t index_tail = (uint16_t) (index_f + 1);
    uint8_t member = 0;
    uint16_t sum = 0;
    for (uint16_t i = 1; i < 13; i++) {
        if (distance[i-1] == 0) {
            continue;
        }
        if (index_head - 0.5f <= index_old_f + portion * i && index_old_f + portion * i < index_head + 0.5f) {
            member++;
            sum += distance[i-1];
        }else {
            if (i == 1) {
                sum = distance[i-1];
                member = 1;
            }else if (member != 0) {
                user_distance_control.circle[index_regulating(index_head)] = sum/member;
                sum = distance[i-1];
                member = 1;
            }
            index_head++;
        }
    }
    user_distance_control.circle[index_regulating(index_head)] = sum/member;
    user_distance_control.delta_angle_old[stp_id] = *delta_angle;
}


void Circle_Handle(DistanceControl* dis_con, const float threshold, CartesianCoord_Point* v_target_cart) {
    filtration(dis_con->circle,dis_con->circle_filtered,0,360* PRECISION_CIR);
    dis_con->obstacle.count = 0;
    for (int i = 0; i < 360* PRECISION_CIR; i++) {
        if (dis_con->circle_filtered[i] < threshold && dis_con->circle_filtered[i] > 0.1f) {
            dis_con->obstacle.angle_index[dis_con->obstacle.count] = i;
            dis_con->obstacle.distance[dis_con->obstacle.count] = dis_con->circle_filtered[i];
            dis_con->obstacle.count++;
        }
    }
    PolarCoord_Point v_target_polar = {0};
    PolarCoord_Point v_target_face_polar= {0};
    PolarCoord_Point v_target_arm_polar= {0};
    PolarCoord_Point v_obstacle_polar= {0};
    RotateZ_Cartesian(v_target_cart,dis_con->delta_angle,v_target_cart);
    CartesianToPolar(v_target_cart,&v_target_polar);

    for (int i = 0; i < dis_con->obstacle.count; i++) {
        if (v_target_polar.radius < 0.1f) {
            break;
        }
        v_obstacle_polar.radius = dis_con->obstacle.distance[i]/DISTOV;
        v_obstacle_polar.yaw = (float)dis_con->obstacle.angle_index[i]/PRECISION_CIR;
        float dotp_result = DotProduct_Polar(&v_target_polar,&v_obstacle_polar);
        if (dotp_result < 0.0f) {
            continue;
        }
        Scale_Polar(&v_obstacle_polar,
            dotp_result/(v_obstacle_polar.radius*v_obstacle_polar.radius),
            &v_target_face_polar);
        Subtract_Polar(&v_target_polar,&v_target_face_polar,&v_target_arm_polar);
        if (v_target_face_polar.radius > v_obstacle_polar.radius) {
            v_target_face_polar.radius = v_obstacle_polar.radius;
        }
        Add_Polar(&v_target_face_polar,&v_target_arm_polar,&v_target_polar);
    }
    PolarToCartesian(&v_target_polar,v_target_cart);
    RotateZ_Cartesian(v_target_cart,-dis_con->delta_angle,v_target_cart);
}



//
//
//
// // /**
// // * @brief
// // * @param
// // */
// // void Circle_Handle(DistanceControl* dis_con, const float threshold) {
// //     filtration(dis_con->circle,dis_con->circle_filtered,0,360* PRECISION_CIR);
// //     dis_con->obstacle.count = 0;
// //     for (int i = 0; i < 360* PRECISION_CIR; i++) {
// //         if (dis_con->circle_filtered[i] < threshold && dis_con->circle_filtered[i] > 0.1f) {
// //             dis_con->obstacle.angle_index[dis_con->obstacle.count] = i;
// //             dis_con->obstacle.distance[dis_con->obstacle.count] = dis_con->circle_filtered[i];
// //             dis_con->obstacle.count++;
// //         }
// //     }
// //     PolarCoord_Point v_de_polar = {0};
// //     CartesianCoord_Point v_de_cartesian = {0};
// //     memset(&(dis_con->v_de_sum_cartesian), 0, sizeof(CartesianCoord_Point));
// //     memset(&(dis_con->v_de_sum_rotated), 0, sizeof(CartesianCoord_Point));
// //     float vx_sq = user_swerve_chassis.vx_current * user_swerve_chassis.vx_current;
// //     float vy_sq = user_swerve_chassis.vy_current * user_swerve_chassis.vy_current;
// //     const float v_current_sq= vx_sq + vy_sq;
// //     for (int i = 0; i < dis_con->obstacle.count; i++) {
// //         v_de_polar.radius = v_current_sq * 1000 / dis_con->obstacle.distance[i];
// //         v_de_polar.yaw = (float)dis_con->obstacle.angle_index[i]/PRECISION_CIR;
// //         PolarToCartesian(&v_de_polar,&v_de_cartesian);
// //         Add_Cartesian(&(dis_con->v_de_sum_cartesian), &v_de_cartesian, &(dis_con->v_de_sum_cartesian));
// //     }
// //     RotateZ_Cartesian(&dis_con->v_de_sum_cartesian,-dis_con->delta_angle,&dis_con->v_de_sum_rotated);
// //     RotateZ_Cartesian(&dis_con->v_de_sum_rotated,180,&dis_con->v_de_sum_rotated);
// // }
//
//
//
//
//
//
//
//
//
