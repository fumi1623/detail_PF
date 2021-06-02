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
  end

  resources :groups, only: [:index, :new, :create, :show, :edit, :update]
  get 'groups/:id/day' => 'groups#day'
  # get 'groups/:id/edit/:id' => 'groups#delete_user'

end
