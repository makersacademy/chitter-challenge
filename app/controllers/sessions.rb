class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/messages'
    else
      flash[:errors] = ["Email or password is not correct"]
      redirect '/sessions/new'
    end
  end

end
