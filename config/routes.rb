Todo::Application.routes.draw do
  devise_for :users
  resources :tasks
end
