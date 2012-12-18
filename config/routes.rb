Sharaton::Application.routes.draw do
  resources :users_products_wanted_actions


  resources :wanted_actions


  resources :products


  resources :users


  root :to => 'products#index'
  
  match 'fblogin' => 'user_session#login_facebook'
  match 'fbcallback'  => 'user_session#login_facebook_callback'
  match 'fblogout' => 'user_session#destroy'
  match 'post_to_fb' => 'user_session#post_to_facebook'
  match 'settings' => 'users#index'
  
  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
