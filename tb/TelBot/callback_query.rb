class CallbackQuery
    def start(message, tb, keyboard)
        if message.data == keyboard.commands[0]
            tb.additional.start(message, tb, keyboard)
        end

        if message.data == keyboard.commands[1]
            tb.additional.stop(message, tb, keyboard)
            #НЕ ЗБЕРІГАЮТЬСЯ ДАНІ У ТАБЛИЦЮ
        end

        if message.data == keyboard.commands[2]
            tb.additional.pause(message, tb, keyboard)
        end

        if message.data == keyboard.commands[3]
            tb.additional.contin(message, tb, keyboard)
        end

        if message.data == keyboard.commands[4]
            tb.additional.info(message, tb, keyboard)
        end

        if message.data == keyboard.commands[5]
            tb.additional.data(message, tb, keyboard)                            	
        end

        if message.data == keyboard.commands[6]
            tb.additional.skale_detail(message, tb, keyboard)
        end

        if message.data == keyboard.commands[7]
            tb.additional.advice(message, tb, keyboard)
        end

        if message.data == keyboard.commands[8]
            tb.additional.advice_h(message, tb, keyboard)
        end

        if message.data == keyboard.commands[9]
            tb.additional.advice_m(message, tb, keyboard)
        end

        if message.data == keyboard.commands[10]
            tb.additional.advice_l(message, tb, keyboard)
        end

        if message.data == keyboard.commands[11]
            tb.additional.high(message, tb, keyboard)
        end

        if message.data == keyboard.commands[12]
            tb.additional.medium(message, tb, keyboard)
        end

        if message.data == keyboard.commands[13]
            tb.additional.low(message, tb, keyboard)
        end
    end
end