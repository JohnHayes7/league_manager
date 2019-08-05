Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static#welcome"
  resources :teams, only:[:index]
  resources :administrators, only:[:show, :new, :create]
  
  resources :seasons, only:[:new, :create, :show, :index] do 
    resources :competitions, only:[:new, :create]
  end
  
  resources :competitions, only:[:show, :index, :edit] do
    resources :matches, only:[:new, :create, :show, :edit]
  end

  resources :teams, only:[:new, :create, :index]  

  resources :locations, only:[:new, :index, :create]

end
