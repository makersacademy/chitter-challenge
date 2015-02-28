class Chitter < Sinatra::Base

get '/users/sign_up' do
    erb :"users/sign_up"
  end

  post '/users/sign_up' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to '/'
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