require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep.rb'
require './database_connection_setup'


class Chitter < Sinatra::Base
  enable :sessions, :method_override 
  register Sinatra::Flash

  get '/peeps' do
    @peeps = Peep.all 
    erb :'peeps'
  end

  post '/peeps' do
    Peep.create(content: params['content'])
    redirect back
  end

  run! if app_file == $0
end