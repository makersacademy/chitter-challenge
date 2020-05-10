require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'


class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do 
    'Welcome to Chitter'
  end 

  get '/chitter' do
    @peep = Peep.all 
    erb(:'main_page')
  end

  post '/chitter/new_peep' do
    session[:peep] = params[:peep]
    redirect '/chitter'
  end 

  run! if app_file == $0

end 
      