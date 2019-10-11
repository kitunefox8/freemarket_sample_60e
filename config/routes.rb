Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"
  
  resources :products, only: [:index] do
    collection do
      get 'buy'
      get 'show'
      get 'show2'
    end
  end
  resources :image_tests, only: [:index, :create]

end
