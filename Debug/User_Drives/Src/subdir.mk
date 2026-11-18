################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../User_Drives/Src/user_adc.c \
../User_Drives/Src/user_buzzer.c \
../User_Drives/Src/user_can.c \
../User_Drives/Src/user_led.c \
../User_Drives/Src/user_pwm.c \
../User_Drives/Src/user_stp23.c \
../User_Drives/Src/user_uart.c 

OBJS += \
./User_Drives/Src/user_adc.o \
./User_Drives/Src/user_buzzer.o \
./User_Drives/Src/user_can.o \
./User_Drives/Src/user_led.o \
./User_Drives/Src/user_pwm.o \
./User_Drives/Src/user_stp23.o \
./User_Drives/Src/user_uart.o 

C_DEPS += \
./User_Drives/Src/user_adc.d \
./User_Drives/Src/user_buzzer.d \
./User_Drives/Src/user_can.d \
./User_Drives/Src/user_led.d \
./User_Drives/Src/user_pwm.d \
./User_Drives/Src/user_stp23.d \
./User_Drives/Src/user_uart.d 


# Each subdirectory must supply rules for building sources it contributes
User_Drives/Src/%.o User_Drives/Src/%.su User_Drives/Src/%.cyclo: ../User_Drives/Src/%.c User_Drives/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/DSP/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-User_Drives-2f-Src

clean-User_Drives-2f-Src:
	-$(RM) ./User_Drives/Src/user_adc.cyclo ./User_Drives/Src/user_adc.d ./User_Drives/Src/user_adc.o ./User_Drives/Src/user_adc.su ./User_Drives/Src/user_buzzer.cyclo ./User_Drives/Src/user_buzzer.d ./User_Drives/Src/user_buzzer.o ./User_Drives/Src/user_buzzer.su ./User_Drives/Src/user_can.cyclo ./User_Drives/Src/user_can.d ./User_Drives/Src/user_can.o ./User_Drives/Src/user_can.su ./User_Drives/Src/user_led.cyclo ./User_Drives/Src/user_led.d ./User_Drives/Src/user_led.o ./User_Drives/Src/user_led.su ./User_Drives/Src/user_pwm.cyclo ./User_Drives/Src/user_pwm.d ./User_Drives/Src/user_pwm.o ./User_Drives/Src/user_pwm.su ./User_Drives/Src/user_stp23.cyclo ./User_Drives/Src/user_stp23.d ./User_Drives/Src/user_stp23.o ./User_Drives/Src/user_stp23.su ./User_Drives/Src/user_uart.cyclo ./User_Drives/Src/user_uart.d ./User_Drives/Src/user_uart.o ./User_Drives/Src/user_uart.su

.PHONY: clean-User_Drives-2f-Src

