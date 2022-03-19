Rails.application.routes.draw do
  resources :availabilities
  resources :appointments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'auth/kakao/callback', to: 'auth#kakao'
end
