class Chitter < Sinatra::Base
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password])
    redirect '/peeps'
  end
end
