require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require './lib/db_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = User.all
    @peeps = Peep.all
    erb(:index)
  end

  post '/add_user' do
    User.setup(name: params[:name])
    flash[:notice] = 'Welcome to Chitter!'
    redirect('/')
  end

  post '/create_peep' do
    Peep.create(txt: params[:txt])
    redirect('/')
  end

  run! if app_file == $0

end
