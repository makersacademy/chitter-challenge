class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    session[:user_id] = user.id
    redirect to('/peeps')
  end
  
end
