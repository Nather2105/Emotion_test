class TelegramBot
    attr_accessor :token, :points, :flag, :skale1, :skale2, :skale3, :skale4, :skale5, 
    :additional, :tb, :additional_message, :tmp, :keyboard

    def initialize
        @token = "TOKEN"
        @points = 0
        @flag = 0
        @skale1 = 0
        @skale2 = 0
        @skale3 = 0
        @skale4 = 0
        @skale5 = 0
        @tb = self
        @additional = Additional.new
        @additional_message = AdditionalMessage.new
        @callback_query = CallbackQuery.new
        @callback_message = CallbackMessage.new
        @keyboard = KeyboardThings.new
    end
    def run
        loop do
            begin
                bot_run
            rescue Telegram::Bot::Exceptions::ResponseError => error
                puts "no connection with Telegram" + error.message
                exit 0
            rescue => error
                puts "another problem" + error.message
            end
        end
    end
    def bot
        Telegram::Bot::Client.run(@token) { |bot| return bot}
    end
    
    def send(*attrs)
        bot.api.send_message(*attrs) 
    end
    def bot_run
        bot.listen do |message|
             Thread.start(message) do |message|
                case message
                when Telegram::Bot::Types::CallbackQuery
                    @callback_query.start(message, @tb, @keyboard)
                when Telegram::Bot::Types::Message
                    @callback_message.start(message, @tb, @keyboard)
                end
             end
        end
    end
    def sends(message, *attrs)
        attrs.each do |attr|
            bot.api.send_message(chat_id: message.from.id, text: attr)
        end

    end

end