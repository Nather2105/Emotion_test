class CallbackMessage
    def start(message, tb, keyboard)
        if message.text == keyboard.commands[14]
            tb.additional_message.start(message, tb, keyboard)
        end

        if message.text == StartBot.arr[0]
            tb.additional_message.counter(-3, tb)
        end

        if message.text == StartBot.arr[1]
            tb.additional_message.counter(-2, tb)
        end

        if message.text == StartBot.arr[2]
            tb.additional_message.counter(-1, tb)
        end

        if message.text == StartBot.arr[3]
            tb.additional_message.counter(1, tb)
        end

        if message.text == StartBot.arr[4]
            tb.additional_message.counter(2, tb)
        end

        if message.text == StartBot.arr[5]
            tb.additional_message.counter(3, tb)
        end


        if message.text == keyboard.commands[15]
            tb.additional_message.help(message, tb, keyboard)
        end
            
        if message.text =~ /^\/stop/
            tb.additional.stop(message, tb, keyboard)
        end

        if message.text =~ /^_/ && tb.flag < 15
            tb.send(chat_id: message.from.id, text: StartBot.Skale[tb.flag])
            tb.additional_message.count(tb)
        end

        if tb.flag == 15 && tb.tmp == true
            tb.additional_message.finish(message, tb, keyboard)
        end
    end
end