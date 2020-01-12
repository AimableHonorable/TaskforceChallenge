Rails.application.routes.draw do
  get 'comments/create'
  devise_for :users
  resources :restaurants do
    resources :comments
  end
  root 'restaurants#index'
  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
