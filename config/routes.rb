Rails.application.routes.draw do
  resources :topics do
    # #34
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions

  # #2
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
