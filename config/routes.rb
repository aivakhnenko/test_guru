Rails.application.routes.draw do
  root to: 'tests#index'
  get 'admin', to: 'admin/tests#index'

  devise_for :users,  path: :gurus, 
                      path_names: { sign_in: :login, sign_out: :logout }, 
                      controllers: { registrations: :registrations },
                      controllers: { sessions: :sessions }

  resources :tests, only: :index do
    post :start, on: :member
  end
  
  resources :test_attempts, only: %i[show update] do
    get :result, on: :member
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: %i[index] do
        resources :answers, shallow: true, except: %i[index]
      end
    end
  end
end
