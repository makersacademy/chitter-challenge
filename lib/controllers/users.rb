class Tweeter < Sinatra::Base
  post '/user' do
    user = User.create(params)

    if user.valid?
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'/user/new'
    end
  end

  get '/user/new' do
    erb :'user/new'
  end
end
