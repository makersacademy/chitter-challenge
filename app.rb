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
    p @peep
    erb(:'main_page')
  end

  get '/chitter/new_peep' do
    erb(:'new_peep')
  end 
  
  post '/chitter/new_peep' do
    Peep.create(text: params[:peep], time: Time.new)
    redirect '/chitter'
  end 

  run! if app_file == $0

end 
