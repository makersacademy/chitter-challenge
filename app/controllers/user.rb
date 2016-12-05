class Chitter< Sinatra::Base
  get '/' do
    erb :first_page
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/log_in/new' do
    erb :log_in
  end

  post '/log_in' do
    user = User.authenticate(params[:username],params[:password])
    if user
      session[:user_id] = user.id
      erb :user
    else
      flash[:errors] = ['The email or password is incorrect']
      redirect 'log_in/new'
    end
  end

  delete '/users' do
    session[:user_id] = nil
    flash[:errors] = ['Bye']
    redirect to '/'
  end

  post '/users' do
    user = User.new(email: params[:email], name: params[:name], password: params[:password], username: params[:username])
    if user.save
      session[:user_id] = user.id
      erb :user
    else
      flash[:errors] = user.errors.full_messages
      redirect '/sign_up'
    end
  end
end
