Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"
  
  resources :products, only: [:index, :show, :new, :create] do
    collection do
      get '/buy/:id'  => 'products#buy'
      get '/buyer/:id' => 'products#buyer'
    end
  end
  
  resources :users, only: [:index] do
    collection do
      get 'mypage'
      get 'profile'
      get 'person'
      get 'creditcard'
      get 'logout'
    end
  end
  resources :image_tests, only: [:index, :create]

  resources :signup, only: [:create] do
    collection do
      get 'session0'
      get 'session1'
      get 'session2'
      get 'session3'
      get 'session4'
      get 'session5'
    end
  end
  
end
