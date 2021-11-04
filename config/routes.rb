Rails.application.routes.draw do
  
# -------------------管理者-----------------------------------------------
  
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  
# -------------------ユーザ-----------------------------------------------
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
end
