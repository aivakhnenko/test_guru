Rails.application.routes.draw do
  root to: 'tests#index'

  resources :tests do
    resources :questions, shallow: true, except: %i[index] do
      resources :answers, shallow: true, except: %i[index]
    end
    
    post :start, on: :member
  end
  
  resources :test_attempts, only: %i[show update] do
    get :result, on: :member
  end
end
