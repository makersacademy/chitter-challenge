require 'sinatra/base'

class Chitter < Sinatra::Base 

  get '/' do 
    erb :index
  end 

  get '/all_peeps' do 
    erb :all_peeps
  end 
  run! if app_file == $0 
end 