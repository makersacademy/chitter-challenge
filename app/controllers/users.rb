class Chitter < Sinatra::Base
  post '/users' do
    user = User.create(name: params[:name], user_name: params[:user_name], password: params[:password])
    session[:user_id] = user.id
    redirect to '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end
end
