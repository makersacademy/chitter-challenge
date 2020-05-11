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

  get '/chitter/new_peep' do
    erb(:'new_peep')
  end 
  
  post '/chitter/new_peep' do
    session[:peep] = params[:peep]
    Peep.create(text: session[:peep], time: Time.new)
    redirect '/chitter'
  end 

  run! if app_file == $0

end 
