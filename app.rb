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
    connection = PG.connect(dbname: 'chitter_test')
    time = Time.new
    year = time.year
    month = time.month
    day = time.day 
    connection.exec("INSERT INTO peep_record (text, time) VALUES('#{session[:peep]}', '#{time.year}#{time.month}#{time.day}')")
    
    #Peep.create(text: session[:text], time: Time.new)
    redirect '/chitter'
  end 

  run! if app_file == $0

end 
      