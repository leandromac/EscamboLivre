Rails.application.routes.draw do

  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :categories, except: [:show, :destroy]# Cria as rotas para categoria e elimina o show
    get 'dashboard', to: 'dashboard#index'
  end

  get 'admin', to: 'backoffice/dashboard#index'

  namespace :site do
    get 'home', to: 'home#index'
  end

  devise_for :admins
  devise_for :members
  get 'home/index'

  root 'site/home#index'

end
