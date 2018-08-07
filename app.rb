require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/peep.rb'

class Chitter < Sinatra::Base
enable :sessions
register Sinatra::Flash
  get '/' do
    erb :index
  end
  post '/peep' do
    Peep.post(params[:name], params[:username], params[:peep])
    redirect '/peeps'
  end
  get '/peeps' do
    @peeps = Peep.view_peeps
    erb :peeps
    
  end
    run! if app_file == $0
end
