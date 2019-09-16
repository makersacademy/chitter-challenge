require 'sinatra/base'
require 'pg'
require './lib/peep.rb'
require './lib/user.rb'
require './lib/databaseconnection_setup.rb'
require './lib/databaseconnection.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/action' do
    redirect '/peep' if params[:submit] == 'view_peeps'
    redirect '/user' if params[:submit] == 'select_user'
    redirect '/peep/post' if params[:submit] == 'post_peep'

  end

  get '/peep' do
    erb :'/peep/index'
  end

  get '/peep/post' do
    erb :'/peep/post'
  end

  post '/peep/store' do
    @id = Peep.user_id_selected(nil)
    Peep.create(@id, User.find_username(@id), Time.now, params[:text] )
    redirect '/'
  end

  get '/user' do
    erb :'/user/index'
  end

  post '/user/select' do
    Peep.user_id_selected(params[:user])
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME

end
