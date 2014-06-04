Todo::Application.routes.draw do

  devise_for :users
  resources :tasks do
    put :complete
    put :clear
  end

  get 'about' => 'welcome#about'
  root to: "welcome#index"
end
