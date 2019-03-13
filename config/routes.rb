Rails.application.routes.draw do
  resources :timeslots
  resources :teacher_subjects
  resources :subjects
  resources :teachers
  devise_for :users

  get 'calendar', to: "calendar#index", as: "calendar"
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
