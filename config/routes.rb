Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: 'recipes' do 
    resources :recipes, only:[:create, :index] 
    put '/recipes', to: 'recipes#update'
  end
  namespace :recipes do
    resources :details, only: [:show]
  end 
end
