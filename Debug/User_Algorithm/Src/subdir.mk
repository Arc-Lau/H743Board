################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../User_Algorithm/Src/data_treating.c \
../User_Algorithm/Src/user_cf.c \
../User_Algorithm/Src/user_coord.c \
../User_Algorithm/Src/user_distance_control.c \
../User_Algorithm/Src/user_fir.c 

OBJS += \
./User_Algorithm/Src/data_treating.o \
./User_Algorithm/Src/user_cf.o \
./User_Algorithm/Src/user_coord.o \
./User_Algorithm/Src/user_distance_control.o \
./User_Algorithm/Src/user_fir.o 

C_DEPS += \
./User_Algorithm/Src/data_treating.d \
./User_Algorithm/Src/user_cf.d \
./User_Algorithm/Src/user_coord.d \
./User_Algorithm/Src/user_distance_control.d \
./User_Algorithm/Src/user_fir.d 


# Each subdirectory must supply rules for building sources it contributes
User_Algorithm/Src/%.o User_Algorithm/Src/%.su User_Algorithm/Src/%.cyclo: ../User_Algorithm/Src/%.c User_Algorithm/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/DSP/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-User_Algorithm-2f-Src

clean-User_Algorithm-2f-Src:
	-$(RM) ./User_Algorithm/Src/data_treating.cyclo ./User_Algorithm/Src/data_treating.d ./User_Algorithm/Src/data_treating.o ./User_Algorithm/Src/data_treating.su ./User_Algorithm/Src/user_cf.cyclo ./User_Algorithm/Src/user_cf.d ./User_Algorithm/Src/user_cf.o ./User_Algorithm/Src/user_cf.su ./User_Algorithm/Src/user_coord.cyclo ./User_Algorithm/Src/user_coord.d ./User_Algorithm/Src/user_coord.o ./User_Algorithm/Src/user_coord.su ./User_Algorithm/Src/user_distance_control.cyclo ./User_Algorithm/Src/user_distance_control.d ./User_Algorithm/Src/user_distance_control.o ./User_Algorithm/Src/user_distance_control.su ./User_Algorithm/Src/user_fir.cyclo ./User_Algorithm/Src/user_fir.d ./User_Algorithm/Src/user_fir.o ./User_Algorithm/Src/user_fir.su

.PHONY: clean-User_Algorithm-2f-Src

