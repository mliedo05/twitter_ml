Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'news' , to: 'news#new_twett'
      get '/:fecha1/:fecha2', to:'news#tweets_date'
    end
  end

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
