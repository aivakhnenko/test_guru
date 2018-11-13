Rails.application.routes.draw do
  root to: 'tests#index'
  get 'admin', to: 'admin/tests#index'

  devise_for :users,  path: :gurus, 
                      path_names: { sign_in: :login, sign_out: :logout }, 
                      controllers: { sessions: :sessions }

  resources :tests, only: :index do
    post :start, on: :member
  end
  
  resources :test_attempts, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  resources :badges, only: :index

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: %i[index] do
        resources :answers, shallow: true, except: %i[index]
      end
    end

    resources :gists, only: :index
    resources :badges
  end

  resource :feedback, only: %i[new create]
end
