Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static#welcome"
  resources :teams, only:[:index]
  resources :administrators, only:[:show, :new, :create, :index, :edit, :update, :destroy]
  
  resources :competitions
  # post '/competitions', :to => 'competitions#create'
  
  resources :seasons, only:[:new, :create, :show, :index, :destroy, :edit, :update] do 
    resources :competitions, only:[:new, :create, :edit, :update]
  end
  
  resources :competitions, only:[:show, :index, :edit, :update] do
    resources :matches, only:[:new, :create, :show, :edit, :update, :destroy] do
      member do
        post :team_goals
        post :team_results
      end
    end
  end

  resources :teams, only:[:new, :create, :index, :show, :update, :edit, :destroy] do
    resources :players, only:[:create, :edit, :update, :destroy]
  end

  resources :locations, only:[:new, :index, :create, :show]

  resources :referees do
    resources :matches, only:[:assign, :unassign] do
      member do
        post :assign
        post :unassign
      end
      resources :match_notes, only:[:new, :create, :edit, :update, :destroy]
    end
  end

  resources :coaches 

  get '/standings', to: 'competitions#standings'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#omniauth'
  

end
