Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"
  
  resources :products, only: [:index, :show, :new, :create,:destroy,:update,:edit] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }

      scope '/products' do
        get '/shipping/:id', to: 'products#shipping', as: 'shipping'
      end
      scope '/products' do
        get '/buy/:id', to: 'products#buy', as: 'buy'
        get '/serach/', to: 'products#serach', as:'serach'
       end
      get '/buyer/:id' => 'products#buyer'
      post 'purchase/:id', to: 'products#purchase', as: 'purchase'
      scope '/products' do
        get '/destroy/:id', to:'products#destroy', as: 'destroy'
      end
      scope '/products' do
        get '/seller/:id', to:'products#seller',as: 'product'
      end
    end
  end

  resources :categories, only: [:index, :show]
  
  resources :users, only: [:index] do
    collection do 
      scope '/users' do
       get '/:id/seller', to: 'users#seller', as: 'seller'
      end
      scope '/users' do
       get '/:id/buy', to: 'users#buy',as: 'buy'
      end
      scope '/users' do
       get  '/:id/sell', to: 'users#sell', as: 'sell'
      end
      scope '/users' do
       get  '/:id/sold', to: 'users#sold', as: 'sold'
      end
      scope '/users' do
       get '/:id/negotiation',to: 'users#negotiation', as: 'negotiation'
      end
      get 'profile'
      get 'person'
      get 'creditcard'
      get 'logout'
  end
    member do
      get  'mypage' 
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
