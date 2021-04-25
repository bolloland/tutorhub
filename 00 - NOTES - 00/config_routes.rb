Rails.application.routes.draw do
    resources :school_classes, only: [:index, :new, :create, :show, :edit, :update]
    
    resources :students, only: [:index, :new, :create, :show, :edit, :update]
    
    patch 'students/:id', to: 'students#update' 
    
    patch 'school_classes/:id', to: 'school_classes#update' 
    

    resources :userhome, :except => [:destroy]
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end
    