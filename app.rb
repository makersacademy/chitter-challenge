require 'sinatra/base'
require 'pg'

require_relative './spec/setup_test_database.rb'
require_relative './lib/peep.rb'

# require_relative

class Chitter < Sinatra::Base
  enable :method_override

  get '/' do
    erb :index
  end 

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end 

  post '/peeps' do
    p params
    Peep.post(content: params['content'], name: params['name'])
    redirect '/peeps'
  end 

  get '/users/new' do
    erb :'users/new'
  end 

  post '/users' do 
    p params
    # create the user here
    redirect '/peeps'
  end 

  run! if app_file == $0

end
