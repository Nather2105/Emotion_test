
class StartBot
    class << self
        attr_accessor :Skale, :arr
        def set
            require File.expand_path('../config/environment',__dir__)
            require 'telegram/bot'
            require_relative 'telegram_bot.rb'
            require_relative 'additional.rb'
            require_relative 'additional_message.rb'
            require_relative 'callback_query.rb'
            require_relative 'callback_message.rb'
            require_relative 'keyboard_things.rb'
            require 'json'
         # unless
           @Skale = File.read('skale.json')
           @Skale = JSON.parse(@Skale)
           @arr = File.read('arr.json')
           @arr = JSON.parse(@arr)         
        end
    end
end