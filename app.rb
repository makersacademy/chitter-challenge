require 'sinatra/base'
require_relative 'chitter'

class ChitterSite < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/chitters' do 
    params[:peep]
  end
  
  get '/chitters/all' do
    @display = ""
   Chitter.all.each do |peep|
    @display += peep + ", "
   end
   @display
  end

  run if app_file == $0
end