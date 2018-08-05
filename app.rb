require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep' 
require 'uri'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
     erb :index
  end

  post '/username' do 
    session[:username] = params[:username]
    redirect('/peeps')
end

post '/user_peep' do 
  session[:user_peep] = params[:user_peep]
  connection = if ENV['ENVIRONMENT'] == 'test'
    PG.connect(dbname: 'chitter_test')
  else
    PG.connect(dbname: 'chitter')
end
  connection.exec("INSERT INTO peeps (username, peep, time) VALUES('#{session[:username]}', '#{session[:user_peep]}','17:34:12')")
redirect ('/peeps')
end 

get '/peeps' do 
  @peeps = Peep.all  
  erb :peeps
end 

run! if app_file == $PROGRAM_NAME
end
