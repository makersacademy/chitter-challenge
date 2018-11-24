require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
# require_relative './lib/chitter.rb'
# require_relative './lib/database_connection_setup.rb'

class Chitter < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do

    erb :'index'
  end

  get '/peeps' do

    erb :'peeps'
  end


  run! if app_file == $0

end
