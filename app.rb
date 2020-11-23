require 'sinatra/base'
require './lib/peep'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base

  configure do
    # allows sinatra to find my CSS stylesheet
    set :public_folder, File.expand_path('../public', __FILE__)
    set :views        , File.expand_path('../views', __FILE__)
    set :root         , File.dirname(__FILE__)
  end

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end

  post '/peeps' do
    Peep.create(post: params[:peep])
    redirect('/peeps')
  end

  get '/user/signup' do
    erb(:signup)
  end

  post '/user' do
    @user = User.create(params[:name], params[:username], params[:email], params[:password])
    redirect('/peeps')
  end


  run! if app_file == $0
end
