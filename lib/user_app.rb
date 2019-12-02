class Chitter < Sinatra::Base

  get '/users/new' do
    @user = Chitter_user.new
    erb :'users/new'
  end

  post '/users' do
    @user = Chitter_user.new(name: params[:name], username: params[:username],
                    email: params[:email], password: params[:password],
                    password_confirmation: params[:password_confirmation] )
