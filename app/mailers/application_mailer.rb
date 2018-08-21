class ApplicationMailer < ActionMailer::Base
  def contact_mail(contact)
    @contact = contact

    # 下記を確認
    mail to: "atsushi.isai131@gmail.com", subject: "お問い合わせの確認メール"
  end
end
