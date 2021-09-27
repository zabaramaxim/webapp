Rails.application.routes.draw do

  root to: 'main#main_page'

  get '/index', to: "home#index"
  get '/profile', to: "home#profile"
  get '/auth/failure' do
    flash[:notice] = params[:message] # if using sinatra-flash or rack-flash
    redirect '/'
  end

  get '/auth/facebook', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
