require 'sinatra/base'
require_relative 'lib/message'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    @messages = Message.all
    erb :index
  end

  get '/write-peep' do
    erb :write_peep
  end

  post '/peeps' do
    Message.create(content: params['content'])
    redirect '/'
  end

  run! if app_file == $0

end
