require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end
  

  get '/' do
    session[:peeps] = []
    erb :index
  end

  get '/peep_form' do
    erb :peep_form
  end

  get'/view_peeps' do
    @peeps = session[:peeps]
    erb :view_peeps
  end

  post '/view_peeps' do
    @peeps = session[:peeps]
    @peeps.push(params[:peep]) 
    erb :view_peeps
  end

  

  run! if app_file == $PROGRAM_NAME
end
