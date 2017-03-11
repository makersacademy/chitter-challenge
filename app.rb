ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './app/models/dm_config'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/signin' do
    #some magic to check credentials
    session[:username] = params[:username]
    session[:password] = params[:password]
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/add' do
    erb :add
  end

  post '/peeps' do
      Peep.create(content: params[:peep_content])
      redirect '/peeps'
  end

end
