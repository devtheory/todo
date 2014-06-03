Todo::Application.routes.draw do

  devise_for :users
  resources :tasks
  resources :tasks do
    put :complete
  end

  get 'about' => 'welcome#about'
  root to: "welcome#index"
end
