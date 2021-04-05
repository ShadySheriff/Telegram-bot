require 'telegram/bot'

token = '1642924455:AAHM54yIj88gMbpCjbkotDdoEos-mHVpo58'
tags = Array.new
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "هلو, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "باي, #{message.from.first_name}")
    when 'بوت سويلي تاك'
      tags.push('@')
      tags.push(message.from.username)
      tags.push(' ')
      bot.api.send_message(chat_id: message.chat.id, text: "تمام")
    when 'بوت تاك للكل'
      bot.api.send_message(chat_id: message.chat.id, text: "#{tags.join}")
    end
  end
end