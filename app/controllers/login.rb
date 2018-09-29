class Chitter < Sinatra::Base
  get '/login' do
    erb :log_in
  end

  post '/login' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :log_in
    end
  end
end
