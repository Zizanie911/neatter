Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :tasks, only: [:index, :new, :create, :update, :edit, :destroy] do
    member do
      patch :mark_as_done
      patch :prioritize
    end
  end

  get "profile", to: 'dashboard#profile', as: :profile
  get "review", to: 'nextday#review', as: :review
  post "reset", to: 'nextday#reset', as: :reset
  post "yesterday", to: 'tasks#yesterday', as: :yesterday
  get '/tagged', to: "tasks#tagged", as: :tagged
  get 'switch_mode', to: "pages#switch_mode"

end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
