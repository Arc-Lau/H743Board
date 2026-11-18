################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../User_Drives/User_Motor/Src/user_dji_motor.c 

OBJS += \
./User_Drives/User_Motor/Src/user_dji_motor.o 

C_DEPS += \
./User_Drives/User_Motor/Src/user_dji_motor.d 


# Each subdirectory must supply rules for building sources it contributes
User_Drives/User_Motor/Src/%.o User_Drives/User_Motor/Src/%.su User_Drives/User_Motor/Src/%.cyclo: ../User_Drives/User_Motor/Src/%.c User_Drives/User_Motor/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/DSP/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-User_Drives-2f-User_Motor-2f-Src

clean-User_Drives-2f-User_Motor-2f-Src:
	-$(RM) ./User_Drives/User_Motor/Src/user_dji_motor.cyclo ./User_Drives/User_Motor/Src/user_dji_motor.d ./User_Drives/User_Motor/Src/user_dji_motor.o ./User_Drives/User_Motor/Src/user_dji_motor.su

.PHONY: clean-User_Drives-2f-User_Motor-2f-Src

