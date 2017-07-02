ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'dm_init'

class Chitter < Sinatra::Base
  enable :sessions
  
  get '/peeps/index' do
    @peeps = Peep.all(order: [ :created_at.desc ])
    erb :'peeps/index'
  end
  
  post '/peeps/new' do
    Peep.create(content: params[:content])
    session[:last_peep] = params[:content]
    redirect '/peeps/index'
  end
  
  helpers do
    def last_peep
      @last_peep ||= Peep.first(content: session[:last_peep])
    end
  end
  
end
