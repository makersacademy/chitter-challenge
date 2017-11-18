class Chitter < Sinatra::Base
  get '/sign_up' do
    erb :'user/new'
  end

  post '/register_user' do
    user = create_user(params)
    create_session_data(user)
    redirect '/sign_up' unless user.id
    redirect "/user/#{user.username}"
  end

  get '/user/:username' do
    load_peeps(params[:username])
    erb :'user/user_area'
  end
end
