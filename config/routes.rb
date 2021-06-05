Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'about' => 'homes#about'

  resources :users, only: [:edit, :update] do
    collection do
      get 'my_page'
      get 'quit'
      patch 'out'
    end
  end

  resources :events, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :maps, only: [:create, :edit, :update, :destroy]
    resources :images, only: [:create, :destroy]
  end
  get 'event/day' => 'events#day'

  resources :groups, only: [:index, :new, :create, :show, :edit, :update]
  get 'groups/:id/day' => 'groups#day'
  # post 'groups/:id/edit' => 'groups#delete_user'
  # get 'groups/:id/edit/:id' => 'groups#delete_user'

  resources :group_users, only: [:create ,:destroy]
  # delete 'group_users/:id' => 'group_users#destroy'
end
