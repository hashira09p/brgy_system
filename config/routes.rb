Rails.application.routes.draw do
  constraints(AdminDomainConstraint.new) do
    scope module: 'admin' do
      devise_for :users, controllers: {
        sessions: 'admin/devise/sessions',
        confirmations: 'admin/devise/confirmations',
        mailers: 'admin/devise/mailers',
        passwords: 'admin/devise/passwords',
        registrations: 'admin/devise/registrations',
        shared: 'admin/devise/shared',
        unlocks: 'admin/devise/unlocks'
      }, as: :admin
      resources :users
      resources :home
      resources :announcements
      resources :requests
    end
    root 'admin/home#index', as: :admin_root
  end

  constraints(BarangayDomainConstraint.new) do
    scope module: 'barangay' do
      devise_for :users, controllers: {
        sessions: 'barangay/users/sessions',
        confirmations: 'barangay/users/confirmations',
        mailers: 'barangay/users/mailers',
        passwords: 'barangay/users/passwords',
        registrations: 'barangay/users/registrations',
        shared: 'barangay/users/shared',
        unlocks: 'barangay/users/unlocks'
      }, as: :barangay
      resources :users
      resources :home
      resources :resources
      resources :requests
    end
    root 'barangay/home#index', as: :barangay_root
    get '/requests/new', to: 'barangay/requests#new', as: :new_barangay_request
    post '/requests', to: 'barangay/requests#create', as: :create_barangay_request
  end
end
