Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  ActiveAdmin.routes(self)
  resources :tweets do
    resources :likes
    member do
      post 'retweet' 
    end
  end 
  post "follow/:id", to: "friends#follow", as: "follow_user"
  delete "follow/:id", to: "friends#destroy", as: "unfollow_user"

  devise_for :users, controllers: {
    registrations: 'users/registrations',} 
  root to: "tweets#index"
end
