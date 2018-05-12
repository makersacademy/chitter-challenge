require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    'Testing infrastructure working!'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peepage)
  end

  get '/signup' do
    erb(:signupform)
  end

  post '/signup' do
    User.create(:username => params[:username], :password => params[:password])
    redirect '/signupsuccess'
  end

  get '/signupsuccess' do
    erb(:signupsuccess)
  end

  run! if app_file == $0

end
