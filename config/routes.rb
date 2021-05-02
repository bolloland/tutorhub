Rails.application.routes.draw do
  devise_for :users
  resources :students do
    resources :tutors do
      resources :lessons
      
    end
  end
    
  resources :tutors do
    resources :students do
      resources :lessons 
      
    end
  end
      
  resources :students
  resources :tutors
  resources :lessons

  get 'tutor_login', to: 'sessions#tutor_new' 
  post 'tutor_login', to: 'sessions#tutor_create' 
  get 'tutor_logout', to: 'sessions#tutor_destroy'
  post 'tutor_logout', to: 'sessions#tutor_destroy'

  get 'student_login', to: 'sessions#student_new' 
  post 'student_login', to: 'sessions#student_create' 
  get 'student_logout', to: 'sessions#student_destroy'
  post 'student_logout', to: 'sessions#student_destroy'
  
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
