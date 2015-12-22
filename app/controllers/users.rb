class Chitter < Sinatra::Base
  enable :sessions

  get '/user/new' do
    erb :'user/new'
  end

  post '/user/create' do
    user = User.create(name: params[:name], email: params[:email],
                username: params[:username], password: params[:password],
                password_confirmation: params[:password_confirmation])
    session[:username] = user.username
    if user
      redirect '/peeps'
    end

  end

  get '/peeps' do
    @username = session[:username]
    erb :'peeps'
  end

end
