Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" } 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :jobs do
    member do
      post :add
      post :remove
    end

    collection do
      get :search
    end

    resources :resumes
  end

  root 'jobs#index'

  resources :admin do
    resources :jobs
  end


end
