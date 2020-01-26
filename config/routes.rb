Rails.application.routes.draw do
  resources :ratings
  resources :interests
  resources :leads
  resources :references
  resources :students
  resources :courses
  resources :colleges
  resources :agents
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  post 'password/forgot', to: 'password#forgot'
  post 'password/reset', to: 'password#reset'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
