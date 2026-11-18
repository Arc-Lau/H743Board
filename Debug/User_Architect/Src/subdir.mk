################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../User_Architect/Src/user_circular_queue.c \
../User_Architect/Src/user_codec.c \
../User_Architect/Src/user_queue.c \
../User_Architect/Src/user_ring_buffe.c \
../User_Architect/Src/user_systick.c 

OBJS += \
./User_Architect/Src/user_circular_queue.o \
./User_Architect/Src/user_codec.o \
./User_Architect/Src/user_queue.o \
./User_Architect/Src/user_ring_buffe.o \
./User_Architect/Src/user_systick.o 

C_DEPS += \
./User_Architect/Src/user_circular_queue.d \
./User_Architect/Src/user_codec.d \
./User_Architect/Src/user_queue.d \
./User_Architect/Src/user_ring_buffe.d \
./User_Architect/Src/user_systick.d 


# Each subdirectory must supply rules for building sources it contributes
User_Architect/Src/%.o User_Architect/Src/%.su User_Architect/Src/%.cyclo: ../User_Architect/Src/%.c User_Architect/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/DSP/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-User_Architect-2f-Src

clean-User_Architect-2f-Src:
	-$(RM) ./User_Architect/Src/user_circular_queue.cyclo ./User_Architect/Src/user_circular_queue.d ./User_Architect/Src/user_circular_queue.o ./User_Architect/Src/user_circular_queue.su ./User_Architect/Src/user_codec.cyclo ./User_Architect/Src/user_codec.d ./User_Architect/Src/user_codec.o ./User_Architect/Src/user_codec.su ./User_Architect/Src/user_queue.cyclo ./User_Architect/Src/user_queue.d ./User_Architect/Src/user_queue.o ./User_Architect/Src/user_queue.su ./User_Architect/Src/user_ring_buffe.cyclo ./User_Architect/Src/user_ring_buffe.d ./User_Architect/Src/user_ring_buffe.o ./User_Architect/Src/user_ring_buffe.su ./User_Architect/Src/user_systick.cyclo ./User_Architect/Src/user_systick.d ./User_Architect/Src/user_systick.o ./User_Architect/Src/user_systick.su

.PHONY: clean-User_Architect-2f-Src

