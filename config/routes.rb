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
  
end
