Rails.application.routes.draw do
  namespace :site do
  get 'home', to: 'home#index'
  end

  get 'backoffice', to: 'backoffice/dashboard#index'
  get 'admin', to: 'backoffice/dashboard#index'
  get 'administrator', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    get 'dashboard', to: 'dashboard#index'
  end

  devise_for :admins
  devise_for :members
  get 'home/index'

  root 'site/home#index'
end
