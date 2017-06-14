Rails.application.routes.draw do

  get 'review/new'

  get 'review/create'

  devise_for :users
  root to: 'courses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses do
    member do
        post :upvote
    end
    resources :subscriptions
    resources :reviews
    resources :events do
      member do
        post :attendance
      end
    end
  end
   get 'dashboard' => 'dashboards#show'
  resources :user

end
