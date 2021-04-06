require 'telegram/bot'

token = '1642924455:AAHM54yIj88gMbpCjbkotDdoEos-mHVpo58'
tags = Array.new
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    puts "#{message.from.username} : #{message.text}"
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "هلو, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "باي, #{message.from.first_name}")
    when 'بوت سويلي تاك'
      if "#{tags.join}".include?(message.from.username)
        bot.api.send_message(chat_id: message.chat.id, text: "موجود تاك لمعرفك اذا تريد امسحة دز بوت امسح تاكي")
      else
        tags.push('@')
      tags.push(message.from.username)
      tags.push(' ')
      bot.api.send_message(chat_id: message.chat.id, text: "تمام")
    end 
    when 'بوت تاك للكل'
      if (tags.size > 0 )
      bot.api.send_message(chat_id: message.chat.id, text: "#{tags.join}")
      end
    end
  end
end
