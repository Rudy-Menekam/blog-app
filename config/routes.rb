Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :users
  # resources :users, only: [:index, :show] do
  #   resources :posts, only: [:index, :show]
  # end
  root "users#index"
  get "/users" , to: "users#index",  as: "users"
  get "/users/:id" , to: "users#show" , as: 'user'
  get "/users/:id/posts" , to: "posts#index", as: "user_posts"
  get "/users/:id/posts/:id" , to: "posts#show", as: "user_post"
  # Defines the root path route ("/")
  # root "articles#index"
end
