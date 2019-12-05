class UserMailer < ApplicationMailer


  default from: 'y_benatar@hotmail.com'

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 
    attachments.inline['logo-bobato-2.png'] = File.read('app/assets/images/logo-bobato-2.png')
    mail(to: @user.email, subject: 'Bienvenue sur BoBato !') 
  end

 
end
