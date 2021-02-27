require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base

    get '/' do
        erb :index
      end
    
    post '/add_peep' do
        Peeps.new_peep(name: params[:name], username: params[:username], message: params[:message])
        p params
        redirect '/'
    end

      run! if app_file == $0
end