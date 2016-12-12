class LaboratorioController < ApplicationController
  def bienvenidos
  end

  def resultados
    render layout: "barranavegacion"
  end

  def resultados
    authenticate_user!
    current_user
  end

  def send_mail
    BasicMailer.basic_mail.deliver_now
    redirect_to root_path
    end

    def upload_file
      current_user
      current_user.galleries << Gallery.create(file: params[:user][:file])
      if current_user.save
        redirect_to root_path, alert: 'Imagen bien'
      else
        redirect_to root_path, alert: 'Imagen mal'
      end
    end

end
