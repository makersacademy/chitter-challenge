class Chitter < Sinatra::Base

  get '/' do
    erb :'index'
  end

  post '/' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
    else
      flash[:messages] = ['The email/password combination is incorrect']
    end
    redirect '/'
  end

end
