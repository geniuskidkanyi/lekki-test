Rails.application.routes.draw do
  resource :signup, only: %i[create]
  resources :authentications, only: %i[create]
  resources :users, only: %i[index]
  post "/archive", to: "users#archive_user"
  post "/unarchive", to: "users#unarchive_user"
end
