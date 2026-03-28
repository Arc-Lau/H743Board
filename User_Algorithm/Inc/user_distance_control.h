#include "../../Core/Inc/bsp_config.h"
#include "../../Core/Inc/bsp.h"
#include "../../User_Algorithm/Inc/user_coord.h"
#include "main.h"










typedef struct {
    uint16_t angle_index[360*PRECISION_CIR];
    float distance[360*PRECISION_CIR];
    uint16_t count;
} ObstacleInfo;

typedef struct {
    float delta_angle;//底盘在悬空坐标系中偏移的角度（悬空坐标系方向在底盘上电后一瞬间确定，x轴正方向指向与串口一相连的传感器，此后坐标系悬空，在世界中的方向不变）
    float delta_angle_old[8];//每个串口上一次发送数据时的角度
    float circle[360*PRECISION_CIR];
    float circle_filtered[360*PRECISION_CIR];
    ObstacleInfo obstacle;
    CartesianCoord_Point* v_de_sum_cartesian;
}DistanceControl;

//函数声明
void Delta_Angle_Update(const float delta_angle_tick);
uint16_t index_regulating(uint16_t index_nr);
float index_f_regulating(float index_nr);
void Circle_Update(float* distance,uint8_t stp_num,uint16_t initial_angle,float* delta_angle,float* delta_angle_old);
void Circle_Handle(DistanceControl* dis_con, const float threshold, CartesianCoord_Point* v_target_cart);





