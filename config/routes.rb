Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :news_feed, only: [:index], constraints: { format: 'json' }
end
