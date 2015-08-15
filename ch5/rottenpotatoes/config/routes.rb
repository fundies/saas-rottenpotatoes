Rottenpotatoes::Application.routes.draw do
  resources :movies do
    resources :reviews
  end
  root :to => redirect('/movies')
	get  'auth/:twitter/callback' => 'sessions#create'
	get 'logout' => 'sessions#destroy'
	get  'auth/failure' => 'sessions#failure'
end
