Rails.application.routes.draw do

# -------------------管理者-----------------------------------------------

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    resources :users, only: [:show, :update, :edit]
    resources :posts, only: [:index, :show, :destroy]
    resources :comments, only: [:index, :destroy]
  end

# -------------------ユーザ-----------------------------------------------
  devise_for :user, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root "homes#top"
    post "/homes/guest_sign_in", to: "homes#guest_sign_in"
    
    resources :user, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get "follow", to: "relationships#follow", as: "follow"
    end
    patch "user/:id/withdraw" => "user#withdraw", as: "user_withdraw"
    get "maps/index"
    get "/map_request", to: "maps#map", as: "map_request"
    post "/rate", to: "rates#create"
    resources :maps, only: [:index]
    resources :posts do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :tag do
      get "posts", to: "posts#search"
    end
  end

end