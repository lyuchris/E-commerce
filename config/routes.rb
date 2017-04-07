Rails.application.routes.draw do
  root "products#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  namespace :admin do
    resources :products
    resources :users do
      member do
        post :to_admin
        post :to_normal
      end
    end
  end

  namespace :account do
    resources :orders
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end
  resources :carts do
    collection do
      post :checkout
      delete :clean
    end
  end

  resources :orders do
    member do
     get :pay_with_credit_card
    end
  end
  
  resources :items, controller: "cart_items"


end
