Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :users
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new]
  end
  get "/users/:id/posts/:id/new" => "comments#new", as: 'new_user_post_comment'
  post "/users/:id/posts/:id" => "comments#create", as: 'user_post_comments'
  post "/users/:id/posts/:id/likes" => "likes#create", as: 'user_post_likes'
  # get "/users" , to: "users#index",  as: "users"
  # get "/users/:id" , to: "users#show" , as: 'user'
  # get "/users/:id/posts" , to: "posts#index", as: "user_posts"
  # get "/users/:id/posts/:id" , to: "posts#show", as: "user_post"
  # Defines the root path route ("/")
  # root "articles#index"
end
