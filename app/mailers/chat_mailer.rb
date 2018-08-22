class ChatMailer < ApplicationMailer
  def chat_mail(chat)
    @chat = chat
    mail to:"atsushi.isai131@gmail.com", subject:"お問い合わせメール"
  end
end
