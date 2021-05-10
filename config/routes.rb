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


  get 'auth/:provider/callback' => 'sessions#tutor_omniauth'
  # get 'auth/:provider/callback' => 'sessions#student_omniauth'

  get 'tutor_login', to: 'sessions#tutor_new' 
  post 'tutor_login', to: 'sessions#tutor_create' 
  get 'tutor_logout', to: 'sessions#tutor_destroy'
  post 'tutor_logout', to: 'sessions#tutor_destroy'

  get 'student_login', to: 'sessions#student_new' 
  post 'student_login', to: 'sessions#student_create' 
  get 'student_logout', to: 'sessions#student_destroy'
  post 'student_logout', to: 'sessions#student_destroy'

  get 'tutor_lessons', to: 'lessons#tutor_lessons'
  get 'student_lessons', to: 'lessons#student_lessons'

  get 'invalid_viewer', to: 'students#invalid_viewer'
  get 'invalid_viewer', to: 'tutors#invalid_viewer'


  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
