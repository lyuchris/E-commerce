Rails.application.routes.draw do
  root "products#index"
  devise_for :users
  namespace :admin do
    resources :products
    resources :users do
      member do
        post :to_admin
        post :to_normal
      end
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end
  resources :carts
  
end
