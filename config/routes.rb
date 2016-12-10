Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
  root 'laboratorio#bienvenidos'

  get 'laboratorio/resultados'
  post 'laboratorio/send_mail'
  post 'laboratorio/upload_file'

end
