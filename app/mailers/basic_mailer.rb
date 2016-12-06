class BasicMailer < ApplicationMailer

  def basic_mail
    @user = {name: 'nikol', age: 15, address: 'falsa 124'}
    mail(to: 'nricano87@gmail.com', subject: 'Mails')
  end

end
