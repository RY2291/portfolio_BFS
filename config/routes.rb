Rails.application.routes.draw do
  
# -------------------管理者-----------------------------------------------
  
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  
# -------------------ユーザ-----------------------------------------------
  devise_for :user, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    get "building_facade_share" => "homes#top", as: "top"
    resources :user, only: [:show, :edit, :update]
     get "user/:id/withdraw" => "user#withdraw", as: "user_withdraw"
    resources :posts do
      resource :favorites, only: [:create, :destroy]
    end
  end
  
end