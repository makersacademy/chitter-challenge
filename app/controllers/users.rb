# Controllers for users path
class Chitter < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(name: params[:name], email: params[:email],
                username: params[:username])
    session[:name] = params[:name]
    redirect '/peeps'
  end

end
