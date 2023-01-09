Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  root 'chatrooms#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :messages, except: [:create, :new]
  post 'message', to: 'messages#create'

  mount ActionCable.server, at: '/cable'

end
