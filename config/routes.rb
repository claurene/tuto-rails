Rails.application.routes.draw do
  get 'welcome/index'
  
  root 'welcome#index'

  resources :articles do
    resources :commentaires
  end
  
end
