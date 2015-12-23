class Chitter < Sinatra::Base

  get '/user/new' do
    erb :'user/new'
  end

  post '/user/create' do
    user = User.create(name: params[:name], email: params[:email],
                username: params[:username], password: params[:password],
                password_confirmation: params[:password_confirmation])

    if user.save
      session[:user_id] = user.id
      redirect '/peeps'
    end

  end

  get '/peeps' do
    erb :'peeps'
  end

end
