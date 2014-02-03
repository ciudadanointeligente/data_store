BillIt::Application.routes.draw do
  resources :low_chamber_agendas


  resources :bills do
  	get 'feed', on: :member
  	get 'search', on: :collection
  	get 'last_update', on: :collection
  end
end