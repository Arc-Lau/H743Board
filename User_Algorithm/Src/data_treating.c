//头文件引用

#include "../../User_Algorithm/Inc/data_treating.h"

#include <string.h>

//私有变量



//函数声明

void treat_Init(Data  *user_data,int begin,int end,int Init_min);
void data_treating(Data *user_data ,float threshold_value) ;
static void filtration(float *Data ,int begin,int end);
// static void peak(int *Peakdata,float *Data,float threshould_value);
// static void findmin(float *min ,int *minnum,int begin,int end,float *data);
static int ringnum(int num,int size);

//函数实现

/**
 * @brief 数据结构初始化函数
 * @param user_data [输出] 用户数据结构体指针，将被初始化
 * @param begin [输入] 数据处理的起始位置（0-359）
 * @param end [输入] 数据处理的结束位置（0-359）
 * @param Init_min [输入] 最小值的初始值
 * @return void
 * @note 该函数会清空data和peakdata数组，并设置初始参数
 */
void treat_Init(Data  *user_data,int begin,int end,int Init_min) {
    user_data->begin = begin;      // 设置数据起始位置
    user_data->end = end;          // 设置数据结束位置
    user_data->min = Init_min;     // 设置最小值初始值
    user_data->min_num = 0;         // 最小值位置初始化为0
    memset(user_data->data, 0, 360 * sizeof(float));      // 清空数据数组
    memset(user_data->peakdata, 0, 360 * sizeof(int));    // 清空峰值标记数组
}

// /**
//  * @brief 数据处理主函数
//  * @param user_data [输入/输出] 用户数据结构体指针
//  *                  输入：data数组（原始数据）、begin、end
//  *                  输出：data数组（滤波后）、min、minnum、peakdata数组
//  * @param threshold_value [输入] 峰值检测的阈值
//  * @return void
//  * @note 依次执行滤波、寻找最小值、峰值检测三个步骤
//  */
// void data_treating(Data *user_data ,float threshold_value) {
//     // 步骤1：对数据进行滑动平均滤波
//     filtration(user_data->data,user_data->begin,user_data->end);
//     // 步骤2：查找指定范围内的最小值及其位置
//     findmin(&user_data->min,&user_data->min_num,user_data->begin,user_data->end,user_data->data);
//     // 步骤3：检测峰值并标记
//     peak(user_data->peakdata , user_data->data , threshold_value);
// }

/**
 * @brief 滑动平均滤波（5点平均）
 * @param Data [输入/输出] 数据所在数组（长度360）
 *             输入：原始数据
 *             输出：滤波后的数据
 * @param begin [输入] 数据处理的起始位置
 * @param end [输入] 数据处理的结束位置
 * @return void
 * @note 使用5点滑动平均滤波，当前点及前后各2个点的平均值
 *       使用循环数组处理边界情况
 */
void filtration(float *Data ,float * Data_filtered, int begin,int end) {
    float tdata[360] = {0};  // 临时数组，保存原始数据
    memcpy(tdata, Data, 360 * sizeof(float));  // 复制原始数据到临时数组

    // 遍历需要滤波的数据范围
    for (int i = begin; i < end; i++) {
        float sum = 0;  // 累加和
        // 对当前点及前后各2个点（共5个点）求和
        for (int j = 0; j < 5; j++) {
            // int snum = i - 2 + j + 360;  // 计算索引（未使用）
            sum += tdata[ringnum( i - 2 + j,360)];  // 使用循环索引累加
        }
        Data_filtered[i] = sum / 5 ;  // 计算平均值并存储
    }

}

// /**
//  * @brief 峰值检测（检测波谷）
//  * @param Peakdata [输出] 峰值位置存储数组（长度360）
//  *                 输出：检测到波谷的位置标记为1，其他为0
//  * @param Data [输入] 数据所在数组（长度360）
//  * @param threshould_value [输入] 阈值，只有小于该值的波谷才被标记
//  * @return void
//  * @note 检测波谷：当前点小于前后3个位置的点，且小于阈值时标记为峰值
//  *       使用循环数组处理边界情况
//  */
// void peak(int *Peakdata,float *Data,float threshould_value) {
//     Peakdata[] = {0}；
//     // 遍历所有数据点
//     for (int i = 0; i < 360; i++) {
//         // 判断当前点是否为波谷（小于前3个点和后3个点）
//         if (Data[i]<Data[ringnum(i - 3 + 360 ,360)] && Data[i]<Data[ringnum(i + 3 + 360 ,360)]){
//             // 如果波谷值小于阈值，则标记为峰值
//             if (Data[i] < threshould_value)
//             Peakdata[i] = 1;
//         }
//     }
// }
//
// /**
//  * @brief 查找指定范围内的最小值及其位置
//  * @param min [输入/输出] 最小值指针
//  *            输入：初始最小值（用于比较）
//  *            输出：找到的最小值
//  * @param minnum [输出] 最小值所在位置的指针
//  *               输出：最小值在数组中的索引
//  * @param begin [输入] 数据搜索的起始位置
//  * @param end [输入] 数据搜索的结束位置
//  * @param data [输入] 数据所在数组
//  * @return void
//  * @note 遍历[begin, end)范围，找到小于等于当前最小值的点并更新
//  */
// void findmin(float *min, int *minnum, int begin, int end, float *data) {
//     // 遍历指定范围的数据
//     for (int i = begin; i < end; i++) {
//         // 如果当前值小于等于已知最小值，则更新最小值和位置
//         if (data[i] <= *min) {
//             *min = data[i];      // 更新最小值
//             *minnum = i;         // 更新最小值位置
//         }
//     }
// }

/**
 * @brief 循环数组索引计算（处理数组边界）
 * @param num [输入] 原始索引值（可能为负数或超出范围）
 * @param size [输入] 数组大小
 * @return [输出] 循环后的有效索引值（0 到 size-1）
 * @note 将任意整数映射到[0, size-1]范围内
 *       例如：num=-1, size=360 -> 返回359
 *            num=360, size=360 -> 返回0
 */
int ringnum(int num ,int size) {
    num=(num + size) % size;  // 先加size确保为正数，再取模得到循环索引
    return num;
}

