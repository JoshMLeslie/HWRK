class UserMailer < ApplicationMailer
  default from: "catlady@catvale.com"

  def welcome_email(user)
    mail(to: user, subject: "Welcome!")
  end
end
