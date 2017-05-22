Rails.application.routes.draw do

  get 'review/new'

  get 'review/create'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses do
    resources :subscriptions
    resources :reviews
    resources :events do
      resources :attendances
    end
  end
   get 'dashboard' => 'dashboards#show'
  resources :user

end
