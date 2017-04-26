Rails.application.routes.draw do


    resources :contact_us
    resources :contacts, only: [:new, :create, :edit, :update, :index, :destroy]  
    root :to => 'main_shots#index'

    #default_url_options :host => "example.com"
    get 'password_resets/new'

    get 'password_resets/edit'

    get 'sessions/new'
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'
    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new, :create, :edit, :update]


    get  '/signup',  to: 'users#new'
    post '/signup',  to: 'users#create'  
    resources :users
    #get 'users/new'
    #get '/entertainments', to:'entertaiments#index'
    #post '/entertainments', to: 'entertaiments#create'                                            
    #get  '/entertainments/new', to: 'entertaiments#new'
    #get  '/entertainments/:id/edit', to: 'entertaiments#edit'
    #get '/entertainments/:id', to: 'entertaiments#show'
    #patch '/entertainments/:id', to: 'entertaiments#update'
    #PUT    /entertaiments/:id(.:format) entertaiments#update
    #delete '/entertainments/:id', to: 'entertaiments#destroy'
    #get 'reservations', to: 'reservations#index'
    resources :reservations, only: [:index, :edit, :update, :show, :destroy]
    resources :entertainments
    resources :main_shots
    resources :booking_posts do
      resources :booking_pictures
      resources :reservations, only: [:new, :create]
    end

    resources :albums do
    	resources :images
    end
    resources :post_slides
    resources :posts
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    patch 'posts/:id', controller: 'posts', action: :update

    match '/test',                    to: 'static_pages#test',                  via: 'get'
    match '/test2',                    to: 'static_pages#test2',                  via: 'get'
    match '/paralax',                    to: 'static_pages#paralax',                  via: 'get'

end
