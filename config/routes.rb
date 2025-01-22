Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  
  post "/parents" => "parents#create"
  get "/parents" => "parents#index"
  get "/parents/current" => "parents#current"
  get "/parents/:id" => "parents#show"

  post "/children" => "children#create"
  get "/children" => "children#index"
  get "/children/current" => "children#current"
  get "/children/:id" => "children#show"
  patch "/children/:id" => "children#update"

  post "/chores" => "chores#create"
  get "/chores" => "chores#index"
  get "/chores/:id" => "chores#show"
  patch "/chores/:id" => "chores#update"
  delete "/chores/:id" => "chores#destroy"

  post "/sessions" => "sessions#create"

  post "/child_chores" => "child_chores#create"
  get "/child_chores" => "child_chores#index"
  get "/child_chores/:child_id/:chore_id" => "child_chores#show"
  patch "/child_chores/:child_id/:chore_id" => "child_chores#update"

  post "/rewards" => "rewards#create"
  get "/rewards" => "rewards#index"
  patch "/rewards/:id" => "rewards#update"
  get "/rewards/:id" => "rewards#show"
  delete "/rewards/:id" => "rewards#destroy"

  post "/used_rewards" => "used_rewards#create"
  get "/used_rewards" => "used_rewards#index"
  patch "/used_rewards/:id" => "used_rewards#update"
  delete "/used_rewards/:id" => "used_rewards#destroy"
end
