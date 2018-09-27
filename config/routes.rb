Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'tests#index'

  resources :tests do
    resources :questions, shallow: true, except: %i[index]
  end
end
#             Prefix Verb   URI Pattern                                  Controller#Action
#               root GET    /                                            tests#index
#              tests GET    /tests(.:format)                             tests#index
#               test GET    /tests/:id(.:format)                         tests#show
#           new_test GET    /tests/new(.:format)                         tests#new
#                    POST   /tests(.:format)                             tests#create
#          edit_test GET    /tests/:id/edit(.:format)                    tests#edit
#                    PATCH  /tests/:id(.:format)                         tests#update
#                    PUT    /tests/:id(.:format)                         tests#update
#                    DELETE /tests/:id(.:format)                         tests#destroy
##    test_questions GET    /tests/:test_id/questions(.:format)          questions#index
#           question GET    /tests/questions/:id(.:format)               questions#show
#  new_test_question GET    /tests/:test_id/questions/new(.:format)      questions#new
#                    POST   /tests/:test_id/questions(.:format)          questions#create
#      edit_question GET    /tests/questions/:id/edit(.:format)          questions#edit
#                    PATCH  /tests/questions/:id(.:format)               questions#update
#                    PUT    /tests/questions/:id(.:format)               questions#update
#                    DELETE /tests/questions/:id(.:format)               questions#destroy
