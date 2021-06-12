Rails.application.routes.draw do
  resources :tweets do
    resources :likes
    member do
      post 'retweet' 
    end
  end 
  devise_for :users, controllers: {
    registrations: 'users/registrations',} 
  root to: "tweets#index"
end
