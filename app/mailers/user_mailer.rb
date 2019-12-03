class UserMailer < ApplicationMailer


  default from: 'noreply@bobato.com'

  def welcome_skipper_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 
    #attachments.inline['logo.png'] = File.read('app/assets/images/logo.png')
    mail(to: @user.email, subject: 'Bienvenue sur BoBato !') 
  end

  def welcome_boatowner_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 
    #attachments.inline['logo.png'] = File.read('app/assets/images/logo.png')
    mail(to: @user.email, subject: 'Bienvenue sur BoBato !') 
  end

end
