Middleware::Application.routes.draw do

  resources :agendas
  resources :bill_quorums
  resources :votes
  # resources :low_chamber_votes
  # resources :high_chamber_votes

  # resources :bills do
    # get 'feed', on: :member
    # get 'search', on: :collection
    # get 'last_update', on: :collection
  # end
end