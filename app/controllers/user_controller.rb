class Chitter < Sinatra::Base
  get '/sign_up' do
    erb :'user/sign_up'
  end

  post '/register_user' do
    create_session_data(params)
    user = create_user(params)
    redirect '/sign_up' unless user
    session[:username] = user.username
    redirect '/'
  end
end
