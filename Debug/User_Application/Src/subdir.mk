################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../User_Application/Src/user_startup_music.c 

OBJS += \
./User_Application/Src/user_startup_music.o 

C_DEPS += \
./User_Application/Src/user_startup_music.d 


# Each subdirectory must supply rules for building sources it contributes
User_Application/Src/%.o User_Application/Src/%.su User_Application/Src/%.cyclo: ../User_Application/Src/%.c User_Application/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/DSP/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-User_Application-2f-Src

clean-User_Application-2f-Src:
	-$(RM) ./User_Application/Src/user_startup_music.cyclo ./User_Application/Src/user_startup_music.d ./User_Application/Src/user_startup_music.o ./User_Application/Src/user_startup_music.su

.PHONY: clean-User_Application-2f-Src

