Rails.application.routes.draw do
  get '/' => 'thrones#index'
  get '/thrones' => 'thrones#index'
  get '/thrones/new' => 'thrones#new'
  post '/thrones' => 'thrones#create'
  get '/thrones/:id' => 'thrones#show'
  get '/thrones/:id/edit' => 'thrones#edit'
  patch '/thrones/:id' => 'thrones#update'
  delete '/thrones/:id' => 'thrones#destroy'
end
