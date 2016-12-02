class LaboratorioController < ApplicationController
  def bienvenidos
  end

  def resultados
    authenticate_user!
  end
end
