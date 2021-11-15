require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep.rb'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end
  

  get '/' do
    erb :index
  end

  get '/peep_form' do
    erb :peep_form
  end

  get '/view_peeps' do
    session[:peeps] = Peep.all
    @peeps = session[:peeps]
    erb :view_peeps
  end

  post '/view_peeps' do
    session[:peeps].push(Peep.new("user","username", params[:peep])) 
    @peeps = session[:peeps]
    erb :view_peeps
  end

  

  run! if app_file == $PROGRAM_NAME
end
