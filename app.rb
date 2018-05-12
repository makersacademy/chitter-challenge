require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'

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
    redirect '/signupsuccess'
  end

  get '/signupsuccess' do
    erb(:signupsuccess)
  end

  run! if app_file == $0

end
