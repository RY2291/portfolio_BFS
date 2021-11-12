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
    get "building_facade_share" => "homes#top", as: "top"
    resources :user, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get "follow" => "relationships#follow", as: "follow"
    end
   patch "user/:id/withdraw" => "user#withdraw", as: "user_withdraw"
   get "maps/index"
   get "/map_request", to: "maps#map", as: "map_request"
   post "/rate" => "rates#create"
   resources :maps, only: [:index]
    resources :posts do
     resources :comments, only: [:create, :destroy]
     resource :favorites, only: [:create, :destroy]
    end
  end

end