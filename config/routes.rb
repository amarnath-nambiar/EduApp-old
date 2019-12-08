Rails.application.routes.draw do
  resources :ratings
  resources :interests
  resources :leads
  resources :references
  resources :students
  resources :courses
  resources :colleges
  resources :agents
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
