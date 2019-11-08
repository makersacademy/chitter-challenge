require 'sinatra/base'
require './lib/chitter'

class ChitterApp < Sinatra::Base
    
    get '/' do
        erb :index
    end

    get '/users' do
        @users = Chitter.return_users
        erb :users
    end
    
    run! if app_file == $0
end