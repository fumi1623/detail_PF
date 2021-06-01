Rails.application.routes.draw do
  get 'maps/create'
  get 'maps/edit'
  get 'events/index'
  get 'events/new'
  get 'events/create'
  get 'events/show'
  get 'events/edit'
  get 'events/update'
  get 'users/my_page'
  get 'users/edit'
  get 'users/update'
  get 'users/quite'
  get 'users/out'
  devise_for :users
  root 'homes#top'
  get 'about' => 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
