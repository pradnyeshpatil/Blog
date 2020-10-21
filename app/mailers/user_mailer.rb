class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def reminder(user,remaining_time)
    @user = user
    @remaining_time = remaining_time
    mail to: user.email, subject: "Reminder"
  end

  def viewer_reminder(post)
    @user = post.user
    @viewers = post.viewers
    @title = post.title
    mail to: @user.email, subject: "Viewers Reminder"
  end
end