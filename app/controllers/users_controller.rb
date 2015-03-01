class Chitter < Sinatra::Base

get '/users/sign_up' do
    erb :"users/sign_up"
  end

  post '/users/sign_up' do
    if params[:password] != params[:password_confirmation]
      flash.now[:errors] = []
      flash.now[:errors] << "Your passwords didn't match. Try again."
      erb :"users/sign_up"
    else
      user = User.new(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
      if user.save
        session[:user_id] = user.id
        redirect to '/'
      else
        flash.now[:errors] = user.errors.full_messages
        erb :"users/sign_up"
      end
    end
  end

  get '/users/sign_in' do
    erb :"users/sign_in"
  end

  post '/users/sign_in' do
    email = params[:email]
    password = params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      redirect to '/'
    else 
      "Those login details are incorrect."
    end
  end

  get '/users/sign_out' do
    session[:user_id] = nil
    redirect to '/'
  end

end