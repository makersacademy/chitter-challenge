require 'data_mapper'
require 'sinatra/base'

require_relative 'models/peeps'
require_relative 'models/users'

class Chitter < Sinatra::Base
  DataMapper.setup(:default, 'postgres://Emma@localhost/chitter')
  DataMapper.finalize
  DataMapper.auto_migrate! # NB wipes table each time

  get '/' do
    @peeps = Peep.all(:order => [:created_at.desc, :id.desc])
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/create_account' do
    session[:current_user] = User.create(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username],
    )
    redirect '/'
  end

  get '/new_peep' do
    erb :new_peep
  end

  post '/create_peep' do
    Peep.create(content: params[:content], user_id: session[:current_user].id)
    redirect '/'
  end

  run! if app_file == $0
end
