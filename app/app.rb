require 'sinatra/base'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base
  set :views, proc {File.join(root,'..','/app/views')}
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end


  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new_peep'
  end

  post '/peeps' do
  Peep.create(message: params[:message])
  redirect '/peeps'
end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/peeps'
  end

run! if app_file == $0
end
