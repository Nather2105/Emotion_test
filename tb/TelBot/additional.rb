class Additional

    def start(message, tb, keyboard)
        tb.points = 0
        tb.flag = 0
        tb.skale1 = 0
        tb.skale2 = 0
        tb.skale3 = 0
        tb.skale4 = 0
        tb.skale5 = 0
        tb.sends(message, StartBot.Skale[tb.flag])
        tb.flag = tb.flag + 1
        markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: StartBot.arr)
        #one_time_keyboard: true
        tb.send(chat_id: message.from.id, text: keyboard.starter[7], reply_markup: markup)
    end

    def stop(message, tb, keyboard)
        tb.points = 0
        tb.flag = 0
        tb.skale1 = 0
        tb.skale2 = 0
        tb.skale3 = 0
        tb.skale4 = 0
        tb.skale5 = 0
        kb = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
        tb.send(chat_id: message.from.id, text: keyboard.finisher[10], reply_markup: kb)
    end

    def pause(message, tb, keyboard)
        tb.flag = tb.flag - 1
        kb = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
        tb.send(chat_id: message.from.id, text: keyboard.pauser[2], reply_markup: kb)
        tb.sends(message, keyboard.pauser[3] + tb.flag + keyboard.pauser[4])
        markup = keyboard.kb_making(
            [keyboard.pauser[1], keyboard.commands[3]],
            [keyboard.finisher[9], keyboard.commands[1]]
        )
        tb.send(chat_id: message.from.id, text: keyboard.starter[6], reply_markup: markup)
    end

    def contin(message, tb, keyboard)
        tb.sends(message,  StartBot.Skale[tb.flag])
        tb.flag = tb.flag + 1
        markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: StartBot.arr)
        #one_time_keyboard: true
        tb.send(chat_id: message.from.id,text: keyboard.starter[7], reply_markup: markup)
    end

    def info(message, tb, keyboard)
        tb.sends(message, keyboard.info[0], keyboard.info[1])
        markup = keyboard.kb_making(
            [keyboard.starter[3], keyboard.commands[0]],
            [keyboard.starter[5], keyboard.commands[7]],
           )
        tb.send(chat_id: message.from.id, text: keyboard.starter[6], reply_markup: markup)
    end

    def data(message, tb, keyboard)
        if tb.points != 0 && tb.flag != 0 && tb.skale1 != 0 && tb.skale2 != 0 && tb.skale3 != 0 && tb.skale4 != 0 && tb.skale5 != 0
            if !User.exists?(telegram_id:message.from.id)
                user = User.create(name: message.from.first_name, telegram_id:message.from.id)
                user.emolevels.create(scale1: skale1, scale2: skale2, scale3: skale3, scale4: skale4, scale5: skale5, emosum: points, time: 1)
                tb.send(chat_id: message.from.id, text: keyboard.finisher[11])
            else
                user = User.find_by(telegram_id:message.from.id)            
                    previous = user.emolevels.last 
                    t = previous.time
                t = t + 1
                user.emolevels.create(scale1: tb.skale1, scale2: tb.skale2, scale3: tb.skale3, scale4: tb.skale4, scale5: tb.skale5, emosum: tb.points, time: t)
                tb.sends(message, keyboard.finisher[11], keyboard.info[2])
                detail(message, tb, previous, keyboard)
            end
        end
    end 

    def skale_detail(message, tb, keyboard)
        tb.sends(message, keyboard.info[3])
        detail(message, tb, tb, keyboard)
        markup = keyboard.kb_making(
            [keyboard.finisher[8], keyboard.commands[5]],
            [keyboard.finisher[9], keyboard.commands[1]]
           )
        tb.send(chat_id: message.from.id, text: keyboard.starter[6], reply_markup: markup)
    end  

    def advice(message, tb, keyboard)
        tb.sends(message, keyboard.info[4],keyboard.info[5], keyboard.info[6], keyboard.info[7], keyboard.info[8])
        markup = keyboard.kb_making(
            [keyboard.starter[3], keyboard.commands[0]],
            [keyboard.starter[4], keyboard.commands[4]],
           )
        tb.send(chat_id: message.from.id, text: keyboard.starter[6], reply_markup: markup)
    end

    def advice_h(message, tb, keyboard)
        tb.sends( message, keyboard.info[4], keyboard.high[0], keyboard.high[1], keyboard.high[2], keyboard.high[3])
        markup = keyboard.kb_making(
            [keyboard.finisher[8], keyboard.commands[5]],
            [keyboard.finisher[9], keyboard.commands[1]]
           )
        tb.send(chat_id: message.from.id, text: keyboard.starter[6], reply_markup: markup)
    end

    def advice_m(message, tb, keyboard)
        tb.sends(message, keyboard.info[4], keyboard.middle[0], keyboard.middle[1], keyboard.middle[2], keyboard.middle[3])
        markup = keyboard.kb_making(
            [keyboard.finisher[8], keyboard.commands[5]],
            [keyboard.finisher[9], keyboard.commands[1]]
           )
        tb.send(chat_id: message.from.id, text: keyboard.starter[6], reply_markup: markup)
    end

    def advice_l(message, tb, keyboard)
        tb.sends(message, keyboard.info[4], keyboard.low[0], keyboard.low[1], keyboard.low[2], keyboard.low[3])
        markup = keyboard.kb_making(
            [keyboard.finisher[8], keyboard.commands[5]],
            [keyboard.finisher[9], keyboard.commands[1]]
           )
        tb.send(chat_id: message.from.id, text: keyboard.starter[6], reply_markup: markup)
    end
    
    def high(message, tb, keyboard)
        tb.sends(message, keyboard.info[9], keyboard.high[4], keyboard.high[5], keyboard.high[6], keyboard.high[7])
        markup = keyboard.kb_making(
            [keyboard.finisher[8], keyboard.commands[5]],
            [keyboard.finisher[9], keyboard.commands[1]]
           )
        tb.send(chat_id: message.from.id, text: keyboard.starter[6], reply_markup: markup)
    end
    def medium(message, tb, keyboard)
        tb.sends(message, keyboard.info[9], keyboard.middle[4], keyboard.middle[5], keyboard.middle[6], keyboard.middle[7])
        markup = keyboard.kb_making(
            [keyboard.finisher[8], keyboard.commands[5]],
            [keyboard.finisher[9], keyboard.commands[1]]
           )
        tb.send(chat_id: message.from.id, text: keyboard.starter[6], reply_markup: markup) 
    end

    def low(message, tb, keyboard)
        tb.sends(message, keyboard.info[9], keyboard.low[4], keyboard.low[5], keyboard.low[6], keyboard.low[7])
        markup = keyboard.kb_making(
            [keyboard.finisher[8], keyboard.commands[5]],
            [keyboard.finisher[9], keyboard.commands[1]]
           )
        tb.send(chat_id: message.from.id, text: keyboard.starter[6], reply_markup: markup)
    end
    
    def detail(message, tb, tb1, keyboard)
        if tb1.skale1 >= 8
            tb.sends(message, keyboard.high[8])
        end
        if tb1.skale1 >= 3 && tb.skale1 <= 7
            tb.sends(message, keyboard.middle[8])
        end
        if tb1.skale1 <= 2
            tb.sends(message, keyboard.low[8])
        end

        if tb1.skale2 >= 8
            tb.sends(message, keyboard.high[9])
        end
        if tb1.skale2 >= 3 && tb1.skale2 <= 7
            tb.sends(message, keyboard.middle[9])
        end
        if tb1.skale2 <= 2
            tb.sends(message, keyboard.low[9])
        end

        if tb1.skale3 >= 8
            tb.sends(message, keyboard.high[10])
        end
        if tb1.skale3 >= 3 && tb1.skale3 <= 7
            tb.sends(message, keyboard.middle[10])
        end
        if tb1.skale3 <= 2
            tb.sends(message, keyboard.low[10])
        end

        if tb1.skale4 >= 8
            tb.sends(message, keyboard.high[11])
        end
        if tb1.skale4 >= 3 && tb1.skale4 <= 7
            tb.sends(message, keyboard.middle[11])
        end
        if tb1.skale4 <= 2
            tb.sends(message, keyboard.low[11])
        end

        if tb1.skale5 >= 8
            tb.sends(message, keyboard.high[12])
        end
        if tb1.skale5 >= 3 && tb1.skale5 <= 7
            tb.sends(message, keyboard.middle[12])
        end
        if tb1.skale5 <= 2
            tb.sends(message, keyboard.low[12])
        end

    end
end