Rainforest::Application.routes.draw do
  # match '/rate' => 'rater#create', :as => 'rate'

  resources :products do 
    resources :reviews
    member do
      post 'vote'
      post 'unvote'
    end
  end

  # I want to add a route for voting and unvoting to the products resource
  # member resource
  # vs collection resource


  
  resources :users, :only => [:new, :create, :show]
  resources :sessions, :only => [:new, :create, :destroy]
  
  # root :to => 'welcome#index'
  get "/login" => "sessions#new"
  root :to => "users#new"
end
