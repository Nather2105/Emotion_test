class AdditionalMessage
    def start(message, tb, keyboard)
        tb.sends(message, "#{keyboard.starter[0]} #{message.from.first_name}!", keyboard.starter[1], keyboard.starter[2])
        markup = keyboard.kb_making(
             [keyboard.starter[3], keyboard.commands[0]],
             [keyboard.starter[4], keyboard.commands[4]],
             [keyboard.starter[5], keyboard.commands[7]]
            )
        tb.send(chat_id: message.chat.id, text: keyboard.starter[6], reply_markup: markup)
    end
    
    def counter(number, tb)
        tb.points = tb.points + number
        tb.tmp = true
    end

    def finish(message, tb, keyboard)
        if tb.flag == 15
            tb.skale5 = tb.points - (tb.skale1 + tb.skale2 + tb.skale3 + tb.skale4)
        end
        kb = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
        tb.send(chat_id: message.chat.id,text: keyboard.finisher[0], reply_markup: kb)
        tb.sends(message, tb.points)
        #ВИВЕСТИ РЕЗУЛЬТАТИ ЗАЛЕЖНО ВІД БАЛІВ
        #ВИВЕСТИ ПОРАДИ ВІДПОВІДНО РЕЗУЛЬТАТІВ	
        if tb.points >= 30
            finish_h(message, tb, keyboard)
         end

        #ВИВЕСТИ РЕЗУЛЬТАТИ ЗАЛЕЖНО ВІД БАЛІВ
        #ВИВЕСТИ ПОРАДИ ВІДПОВІДНО РЕЗУЛЬТАТІВ	
        if tb.points >= 16 && tb.points <= 29
            finish_m(message, tb, keyboard)
        end

        #ВИВЕСТИ РЕЗУЛЬТАТИ ЗАЛЕЖНО ВІД БАЛІВ
        #ВИВЕСТИ ПОРАДИ ВІДПОВІДНО РЕЗУЛЬТАТІВ
        if tb.points <= 15
            finish_l(message, tb, keyboard)
        end
    end

    def finish_h(message, tb, keyboard)
        tb.sends(message, keyboard.finisher[1])
        kb = [
            keyboard.part_of_kb(text: keyboard.finisher[4], callback_data: keyboard.commands[11]),
            keyboard.part_of_kb(text: keyboard.finisher[5], callback_data: keyboard.commands[8]),
            keyboard.part_of_kb(text: keyboard.finisher[6], callback_data: keyboard.commands[6]),
            keyboard.part_of_kb(text: keyboard.finisher[7], url: keyboard.commands[16]),
            keyboard.part_of_kb(text: keyboard.finisher[8], callback_data: keyboard.commands[16]),
            keyboard.part_of_kb(text: keyboard.finisher[9], callback_data: keyboard.commands[1]),
        ]
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
        tb.send(chat_id: message.chat.id, text: keyboard.starter[6], reply_markup: markup)
    end

    def finish_m(message, tb, keyboard)
        tb.sends(message, keyboard.finisher[2])
        kb = [
            keyboard.part_of_kb(text: keyboard.finisher[4], callback_data: keyboard.commands[12]),
            keyboard.part_of_kb(text: keyboard.finisher[5], callback_data: keyboard.commands[9]),
            keyboard.part_of_kb(text: keyboard.finisher[6], callback_data: keyboard.commands[6]),
            keyboard.part_of_kb(text: keyboard.finisher[7], url: keyboard.commands[16]),
            keyboard.part_of_kb(text: keyboard.finisher[8], callback_data: keyboard.commands[16]),
            keyboard.part_of_kb(text: keyboard.finisher[9], callback_data: keyboard.commands[1]),
        ]
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
        tb.send(chat_id: message.chat.id, text: keyboard.starter[6], reply_markup: markup)
    end

    def finish_l(message, tb, keyboard)
        tb.sends(message, keyboard.finisher[3])
        kb = [
            keyboard.part_of_kb(text: keyboard.finisher[4], callback_data: keyboard.commands[13]),
            keyboard.part_of_kb(text: keyboard.finisher[5], callback_data: keyboard.commands[10]),
            keyboard.part_of_kb(text: keyboard.finisher[6], callback_data: keyboard.commands[6]),
            keyboard.part_of_kb(text: keyboard.finisher[7], url: keyboard.commands[16]),
            keyboard.part_of_kb(text: keyboard.finisher[8], callback_data: keyboard.commands[16]),
            keyboard.part_of_kb(text: keyboard.finisher[9], callback_data: keyboard.commands[1]),
        ]
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
        tb.send(chat_id: message.chat.id, text: keyboard.starter[6], reply_markup: markup) 
    end

    def count(tb)
        if tb.flag == 3
            tb.skale1 = tb.points	
        end
        if tb.flag == 6
            tb.skale2 = tb.points - tb.skale1
        end
        if tb.flag == 9
            tb.skale3 = tb.points - (tb.skale1 + tb.skale2)
        end
        if tb.flag == 12
            tb.skale4 = tb.points - (tb.skale1 + tb.skale2 + tb.skale3)
        end

        tb.flag = tb.flag + 1
        tb.tmp = false
    end

    def help(message, tb, keyboard)
        markup = keyboard.kb_making(
            [keyboard.pauser[0], keyboard.commands[2]],
            [keyboard.pauser[1], keyboard.commands[3]],
            [keyboard.finisher[9], keyboard.commands[1]]
           )
        tb.send(chat_id: message.chat.id, text: keyboard.starter[6], reply_markup: markup)
    end
end