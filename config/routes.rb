Rails.application.routes.draw do
  resources :availabilities
  resources :appointments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'auth/kakao_login'
  get 'auth/kakao_login_code'
  get 'auth/kakao_info'
  get 'auth/kakao_signup_new'
  post 'auth/kakao_signup_create'
  get 'auth/logout'

  get 'auth/kakao_unlink'
  get 'auth/show_session'
  delete 'auth/destroy_user'

  root to: "home#index"
  get "landing", to: "home#landing"
end
