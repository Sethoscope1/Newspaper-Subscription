PaperSubs::Application.routes.draw do

  resources :newspapers

  resources :users

  resources :subscription_plans

end
