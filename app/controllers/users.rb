class Chitter < Sinatra::Base

  get '/users/sign-up' do
    erb :'users/new'
  end

  post '/users/sign-up' do
    User.create(email: params[:email], password: params[:password])
    redirect '/'
  end

end
