Rails.application.routes.draw do

  # This will prevent the "name collision"
  root to: 'home#index', as: nil

  scope '/:locale' do

    root to: 'home#index'

    # Users
    resources :users do
      resources :trips, only: [:create, :destroy]
    end

    resources :sessions, only: [:new, :create, :destroy]

    # Post
    resources :posts do
      resources :comments, only: [:create]
    end

    get '/posts/:id/joiners', to: 'posts#joiners', as: "joiners"

    get '/users/:id/all-posts', to: 'users#all_posts', as: "history"

    # Discover
    get '/discover', to: 'posts#index'
    get 'discover/photoshoots'
    get 'discover/tips'
    get 'discover/trips'

    # search
    get '/search', to: 'search#index'

    # Login & Sign up
    get '/login', to: 'sessions#new'
    get '/signup', to: 'users#new'

    # Follower
    # The POST action is used because this is similar to making a change or update to a user —
    # the data is being updated by associating a follow to the follower and followee.
    resources :follows
    post '/users/:id/follow', to: "users#follow", as: "follow_user"
    post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

    # Terms
    resources :legals

    # Styleguide
    get 'styleguide/index'
    get 'styleguide/atoms'
    get 'styleguide/molecules'
    get 'styleguide/organisms'
  end

  # workaround like post with I18n
  resources :posts do
    member do
      put '/like', to: 'posts#like'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
