################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../SEGGER_RTT/SEGGER_RTT.c \
../SEGGER_RTT/SEGGER_RTT_printf.c \
../SEGGER_RTT/user_JScope_Transmit.c 

S_UPPER_SRCS += \
../SEGGER_RTT/SEGGER_RTT_ASM_ARMv7M.S 

OBJS += \
./SEGGER_RTT/SEGGER_RTT.o \
./SEGGER_RTT/SEGGER_RTT_ASM_ARMv7M.o \
./SEGGER_RTT/SEGGER_RTT_printf.o \
./SEGGER_RTT/user_JScope_Transmit.o 

S_UPPER_DEPS += \
./SEGGER_RTT/SEGGER_RTT_ASM_ARMv7M.d 

C_DEPS += \
./SEGGER_RTT/SEGGER_RTT.d \
./SEGGER_RTT/SEGGER_RTT_printf.d \
./SEGGER_RTT/user_JScope_Transmit.d 


# Each subdirectory must supply rules for building sources it contributes
SEGGER_RTT/%.o SEGGER_RTT/%.su SEGGER_RTT/%.cyclo: ../SEGGER_RTT/%.c SEGGER_RTT/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/DSP/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
SEGGER_RTT/%.o: ../SEGGER_RTT/%.S SEGGER_RTT/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-SEGGER_RTT

clean-SEGGER_RTT:
	-$(RM) ./SEGGER_RTT/SEGGER_RTT.cyclo ./SEGGER_RTT/SEGGER_RTT.d ./SEGGER_RTT/SEGGER_RTT.o ./SEGGER_RTT/SEGGER_RTT.su ./SEGGER_RTT/SEGGER_RTT_ASM_ARMv7M.d ./SEGGER_RTT/SEGGER_RTT_ASM_ARMv7M.o ./SEGGER_RTT/SEGGER_RTT_printf.cyclo ./SEGGER_RTT/SEGGER_RTT_printf.d ./SEGGER_RTT/SEGGER_RTT_printf.o ./SEGGER_RTT/SEGGER_RTT_printf.su ./SEGGER_RTT/user_JScope_Transmit.cyclo ./SEGGER_RTT/user_JScope_Transmit.d ./SEGGER_RTT/user_JScope_Transmit.o ./SEGGER_RTT/user_JScope_Transmit.su

.PHONY: clean-SEGGER_RTT

