Rails.application.routes.draw do
  resources :ratings
  resources :leads
  resources :references
  resources :students
  resources :courses
  resources :colleges
  resources :agents
  resources :interests do
    get 'interested_courses', on: :member
  end
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  post 'password/forgot', to: 'password#forgot'
  post 'password/reset', to: 'password#reset'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
