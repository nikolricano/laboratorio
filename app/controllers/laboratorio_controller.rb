class LaboratorioController < ApplicationController
  def bienvenidos
  end

  def resultados
    authenticate_user!
  end

  def send_mail
    BasicMailer.basic_mail.deliver_now
    redirect_to root_path
    end
end
