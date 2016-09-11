class Chitter < Sinatra::Base

  get '/user/sign_up' do
    erb(:'user/sign_up')
  end

  post '/user/sign_up' do
    user = User.create(name: params[:name], user_name: params[:user_name], email: params[:email], password: params[:password])
    if user.save
      session[:user_name] = user.user_name
      redirect '/'
    else
      flash[:error] = user.errors.full_messages
      redirect '/user/sign_up'
    end
  end

  get '/user/sign_in' do
    erb(:'user/sign_in')
  end

  post '/user/sign_in' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_name] = user.user_name
      redirect '/feed'
    else
      flash[:login_failed] = "Invalid email or password. Try again!"
      redirect '/user/sign_in'
    end
  end

  post '/user/log_out' do
    session[:user_name] = nil
    redirect '/feed'
  end


end
