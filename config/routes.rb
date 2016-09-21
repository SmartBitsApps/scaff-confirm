Rails.application.routes.draw do
 
  
  get 'subscriptions/index'

  get 'positions/index'

  get 'jobs/index'

  get 'projects/index'

  get 'dashboard/index'

  #devise_for :admins, module: "admins", path: 'master', path_names: { sign_in: 'prihlaseni', sign_out: 'odhlaseni', password: 'heslo', unlock: 'odblokovani' }
  #devise_for :managers, module: "managers", path: 'manazer', path_names: { sign_in: 'prihlaseni', sign_out: 'odhlaseni', password: 'heslo', confirmation: 'potvrzeni', unlock: 'odblokovani' }
  devise_for :users, module: "users", path: 'uzivatel', path_names: { sign_in: 'prihlaseni', sign_out: 'odhlaseni', password: 'heslo', confirmation: 'potvrzeni', unlock: 'odblokovani', sign_up: 'registrace' }
  
  #devise_for :users, :controllers => { 
  #  :registrations => "users/registrations",
  #  :sessions => "users/sessions",
  #  :passwords => "users/passwords" , 
  #  :confirmations => "users/confirmations" 
  #}

  resources :after_register
  
  resources :users, :path => 'uzivatel', :controller => 'users' do
    member do
      resource :account, :path => 'ucet', :only => [:show, :edit, :update] do
        #resources :after_register
        resources :addresses
      end
    end
  end
  
  #resources :managers, :path => 'manazer' do
  #  member do
  #    
  #  end
  #end
  
  
  #devise_scope :admin do
  #  get 'master',  to: 'admins/sessions#new'
  #  delete 'master/odhlaseni', to: 'admins/sessions#destroy'
  #end
  #
  #devise_scope :manager do
  #  get 'man',  to: 'managers/sessions#new'
  #  delete 'man/odhlaseni', to: 'managers/sessions#destroy'
  #end
  
                                                                        
  devise_scope :user do
    get 'registrace',  to: 'users/registrations#new'
    get 'prihlaseni',  to: 'users/sessions#new'
    delete 'odhlaseni', to: 'users/sessions#destroy'
  end
  
  root 'welcome#index'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
