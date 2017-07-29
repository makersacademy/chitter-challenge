# Controllers for users path
class Chitter < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    p "Reached post users"
    session[:name] = params[:name]
    redirect '/peeps'
  end

end
