class KeyboardThings
    attr_accessor :starter, :finisher, :pauser, :info, :low, :middle, :high, :commands
    def initialize
        @starter = File.read('start.json')
        @starter = JSON.parse(@starter)
        @finisher = File.read('finish.json')
        @finisher = JSON.parse(@finisher)
        @pauser = File.read('pause.json')
        @pauser = JSON.parse(@pauser)
        @info = File.read('info.json')
        @info = JSON.parse(@info)
        @low = File.read('low.json')
        @low = JSON.parse(@low)
        @middle = File.read('middle.json') 
        @middle = JSON.parse(@middle)
        @high = File.read('high.json')
        @high = JSON.parse(@high)
        @commands = File.read('cbd.json')
        @commands = JSON.parse(@commands)
    end

    def kb_making(*attrs)
        kb = []
        attrs.each do |attr|
            kb << Telegram::Bot::Types::InlineKeyboardButton.new(text: attr[0], callback_data: attr[1])
        end
        Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
    end

    def part_of_kb(text)
        Telegram::Bot::Types::InlineKeyboardButton.new(text)
    end
end