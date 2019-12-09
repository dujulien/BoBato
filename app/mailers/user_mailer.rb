class UserMailer < ApplicationMailer
  default from: 'noreply@bobato.com'

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 
    attachments.inline['logo-bobato-dark.png'] = File.read(Rails.application.assets['logo-bobato-dark.png'].pathname)
    mail(to: @user.email, subject: 'Bienvenue sur BoBato !') 
  end


  def convoy_conf_email(convoy)
  	@convoy = convoy
  	attachments.inline['logo-bobato-dark.png'] = File.read(Rails.application.assets['logo-bobato-dark.png'].pathname)
    mail(to: @convoy.boat_owner.email, subject: "Vous venez de créer un convoi sur BoBato !")
  end


  def submission_conf_email(submission, user)
  	@submission = submission
  	@user = user
  	attachments.inline['logo-bobato-dark.png'] = File.read(Rails.application.assets['logo-bobato-dark.png'].pathname)
  	mail(to: @user.email, subject: 'Nouvelle demande de participation sur Bobato !') 
  end


  def delivery_conf_email(delivery,user)
  	@delivery = delivery
  	@user = user
  	attachments.inline['logo-bobato-dark.png'] = File.read(Rails.application.assets['logo-bobato-dark.png'].pathname)
  	mail(to: @user.email, subject: 'Confirmation de votre convoyage sur Bobato !') 
  end


  def delivery_to_admin_email(delivery)
    @delivery = delivery
    attachments.inline['logo-bobato-dark.png'] = File.read(Rails.application.assets['logo-bobato-dark.png'].pathname)
    mail(to: "bobato.thp@gmail.com", subject: "Nouvelle commande de #{@delivery.skipper.profile.first_name}!")     
  end
 
end
