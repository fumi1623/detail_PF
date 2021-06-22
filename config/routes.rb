Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'about' => 'homes#about'

  resources :users, only: %i[edit update] do
    collection do
      get 'my_page'
      get 'quit'
      patch 'out'
    end
  end

  resources :events, only: %i[index new create show edit update destroy] do
    resources :maps, only: %i[create edit update destroy]
    resources :images, only: %i[create destroy]
  end
  get 'event/day' => 'events#day'
  get 'event/tag' => 'events#tag'

  resources :presets, only: %i[new create destroy]

  resources :groups, only: %i[index create show edit update] do
    get 'day'
  end

  resources :group_users, only: %i[create destroy]
  patch 'group_users/:id' => 'group_users#accept', as: :group_users_accept
  get 'group_users/:id' => 'group_users#reject', as: :group_users_reject
end
