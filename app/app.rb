ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'tilt/erb'
require_relative 'models/peep'

class Chitter < Sinatra::Base 
  
  get '/' do 
    'Hello Chitter!'
  end

  get '/peeps' do 
    @peeps = Peep.all 
    erb :'peeps/index'
  end

  post '/peeps' do 
    Peep.create(content: params[:peep] , time: Time.now.strftime("%H:%M:%S %Y-%m-%d"))
    redirect to('/peeps')
  end

  get '/peeps/new' do 
    erb :'peeps/new'
  end

  run! if app_file == $0

end
