Rails.application.routes.draw do
  resources :timeslots do
    member do
      get 'edit_calendar', to: "timeslots#edit_calendar", as: 'edit_calendar'
      patch 'update_calendar', to: "timeslots#update_calendar", as: 'update_calendar'

    end

  end
  post 'timeslots/new', to: "timeslots#create"

  resources :teacher_subjects
  resources :subjects
  resources :teachers
  devise_for :users

  get 'calendar', to: "calendar#index", as: "calendar"
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
