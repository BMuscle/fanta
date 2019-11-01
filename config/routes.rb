Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :edit, :update, :show]
  resources :ranking, only: [:show, :create], param: :music_name
end
