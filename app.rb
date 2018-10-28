require 'sinatra/base'
require 'sinatra/flash'
require './lib/chitter'
require './lib/user'

class App < Sinatra::Base

enable :sessions
register Sinatra::Flash

  get '/chitter' do
    @peeps = Chitter.all
    erb(:index)
  end

  post '/peep_post' do
    Chitter.create_peep(params[:name], params[:username], params[:peep])
    redirect to('/chitter')
  end

  post '/sign_up' do
    erb(:sign_up)
  end

  post '/sign_up_post' do
    if params[:name] != nil
      @user = User.create(params[:name], params[:username], params[:email], params[:password])
      @@current_user = @user
    else
      @@current_user = User.find_details(params[:username])[0]
    end
    redirect to('/chitter/logged_in')
  end

  get '/chitter/logged_in' do
    @peeps = Chitter.all
    @user = @@current_user
    erb(:logged_in)
  end

  post '/chitter/user_wall' do
    @user = @@current_user
    Chitter.all
    Chitter.create_peep(@@current_user.name, @@current_user.username, params[:peep])
    redirect to('/chitter/logged_in')
  end

  post '/log_in' do
    erb(:enter_log_in)
  end

  run! if app_file == $0
end
