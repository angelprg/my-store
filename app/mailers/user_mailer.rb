class UserMailer < ApplicationMailer
  default from: 'mystore@example.com'

  def article_update
    @article = params[:article]
    @user = params[:user]
    @update_type = params[:update_type]
    mail(to: @user.email, subject: "MyStore update: An article has been #{@update_type.downcase}")
  end

end
