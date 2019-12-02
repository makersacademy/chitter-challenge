require 'sinatra/base'

class Peeps < Sinatra::Base

  get '/' do
    'List of Peeps'
  end

  get '/peeps' do
    @peeps = ["I am posting a message to Chitter"]

    erb :'index'
  end

run! if app_file == $0
end
