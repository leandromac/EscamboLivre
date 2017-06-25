Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
 get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :send_mail, only: [:edit, :create]
    resources :categories, except: [:show, :destroy]# Cria as rotas para categoria e elimina o show
    resources :admins, except: [:show]
    resources :diagrams, only: [:index]
    get 'dashboard', to: 'dashboard#index'
end

  namespace :site do
    get 'home', to: 'home#index'
    get 'search', to: 'search#ads'
    resources :comments, only: [:create]

    namespace :profile do
      resources :dashboard, only: [:index]
      resources :ads, only: [:index, :edit, :update, :new, :create, :destroy]
    end

    resources :ad_detail, only: [:index, :show]
    resources :categories, only: [:index, :show]
  end

  devise_for :admins, :skip => [:registrations]
  devise_for :members, controllers: { sessions: 'members/sessions' }

  root 'site/home#index'

end
