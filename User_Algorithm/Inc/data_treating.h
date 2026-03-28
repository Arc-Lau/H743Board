//
// Created by Pluto on 2026/2/25.
//

#ifndef UNTITLED_DATA_TREATING_H
#define UNTITLED_DATA_TREATING_H

#endif //UNTITLED_DATA_TREATING_H
//头文件引用
#include <stdio.h>
#include <string.h>


//结构体

typedef struct {
    float data[360];
    int peakdata[360];
    float min;
    int min_num;
    int begin;
    int end;
} Data;

//函数声明

void treat_Init(Data  *user_data,int begin,int end,int Init_min);
// void data_treating(Data *user_data ,float threshold_value) ;
int ringnum(int num ,int size);
void filtration(float *Data ,float * Data_filtered, int begin,int end);

