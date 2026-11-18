################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../User_Algorithm/User_Controller/Src/user_adrc.c \
../User_Algorithm/User_Controller/Src/user_cascade.c \
../User_Algorithm/User_Controller/Src/user_inc_pid.c \
../User_Algorithm/User_Controller/Src/user_ladrc.c \
../User_Algorithm/User_Controller/Src/user_pid.c \
../User_Algorithm/User_Controller/Src/user_pid_tolerance.c 

OBJS += \
./User_Algorithm/User_Controller/Src/user_adrc.o \
./User_Algorithm/User_Controller/Src/user_cascade.o \
./User_Algorithm/User_Controller/Src/user_inc_pid.o \
./User_Algorithm/User_Controller/Src/user_ladrc.o \
./User_Algorithm/User_Controller/Src/user_pid.o \
./User_Algorithm/User_Controller/Src/user_pid_tolerance.o 

C_DEPS += \
./User_Algorithm/User_Controller/Src/user_adrc.d \
./User_Algorithm/User_Controller/Src/user_cascade.d \
./User_Algorithm/User_Controller/Src/user_inc_pid.d \
./User_Algorithm/User_Controller/Src/user_ladrc.d \
./User_Algorithm/User_Controller/Src/user_pid.d \
./User_Algorithm/User_Controller/Src/user_pid_tolerance.d 


# Each subdirectory must supply rules for building sources it contributes
User_Algorithm/User_Controller/Src/%.o User_Algorithm/User_Controller/Src/%.su User_Algorithm/User_Controller/Src/%.cyclo: ../User_Algorithm/User_Controller/Src/%.c User_Algorithm/User_Controller/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/DSP/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-User_Algorithm-2f-User_Controller-2f-Src

clean-User_Algorithm-2f-User_Controller-2f-Src:
	-$(RM) ./User_Algorithm/User_Controller/Src/user_adrc.cyclo ./User_Algorithm/User_Controller/Src/user_adrc.d ./User_Algorithm/User_Controller/Src/user_adrc.o ./User_Algorithm/User_Controller/Src/user_adrc.su ./User_Algorithm/User_Controller/Src/user_cascade.cyclo ./User_Algorithm/User_Controller/Src/user_cascade.d ./User_Algorithm/User_Controller/Src/user_cascade.o ./User_Algorithm/User_Controller/Src/user_cascade.su ./User_Algorithm/User_Controller/Src/user_inc_pid.cyclo ./User_Algorithm/User_Controller/Src/user_inc_pid.d ./User_Algorithm/User_Controller/Src/user_inc_pid.o ./User_Algorithm/User_Controller/Src/user_inc_pid.su ./User_Algorithm/User_Controller/Src/user_ladrc.cyclo ./User_Algorithm/User_Controller/Src/user_ladrc.d ./User_Algorithm/User_Controller/Src/user_ladrc.o ./User_Algorithm/User_Controller/Src/user_ladrc.su ./User_Algorithm/User_Controller/Src/user_pid.cyclo ./User_Algorithm/User_Controller/Src/user_pid.d ./User_Algorithm/User_Controller/Src/user_pid.o ./User_Algorithm/User_Controller/Src/user_pid.su ./User_Algorithm/User_Controller/Src/user_pid_tolerance.cyclo ./User_Algorithm/User_Controller/Src/user_pid_tolerance.d ./User_Algorithm/User_Controller/Src/user_pid_tolerance.o ./User_Algorithm/User_Controller/Src/user_pid_tolerance.su

.PHONY: clean-User_Algorithm-2f-User_Controller-2f-Src

