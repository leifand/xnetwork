Rails.application.routes.draw do
  # Application Routes
  root 'application#index'
  # User Routes
  resources :users
  get 'dashboard' => 'users#dashboard'
  # Session Routes
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # Invitation Routes
  get 'invite/:id' => 'invitations#create'
  get 'accept/:id' => 'invitations#accept'
  get 'ignore/:id' => 'invitations#ignore'
  #resources :shoes
  #post 'ideas/:id/user' => 'ideas#create'
  #delete 'ideas/:id/user' => 'ideas#destroy'
  # Like Routes
  #get 'dashboard/:id' => 'shoes#dashboard'
  #get 'sales/:id' => 'sales#create'
end
