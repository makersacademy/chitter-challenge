class Chitter < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
  end

end
