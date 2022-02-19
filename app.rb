require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

get '/' do
  erb :index
end

post '/peep_page' do
  @peep = params[:peep]  
  erb :peep_page
end

  run! if app_file == $0
end 