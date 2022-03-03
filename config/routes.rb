Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :tasks, only: [:index, :new, :create] do
    member do
      patch :mark_as_done
    end
  end
  get "profile", to: 'dashboard#profile', as: :profile
end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
