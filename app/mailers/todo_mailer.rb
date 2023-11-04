class TodoMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def new_todo
    @user = params[:user]
    @todo  = params[:todo]
    mail(to: @user.email, subject: 'New Todo Created')
  end
end
