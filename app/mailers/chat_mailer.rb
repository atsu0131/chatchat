class ChatMailer < ApplicationMailer
  def chat_mail(chat)
    @chat = chat
    mail to: @chat.user.email, subject:"お問い合わせメール"
  end
end
