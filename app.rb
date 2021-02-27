require 'sinatra/base'
require './lib/peeps'
require 'pg'

class Chitter < Sinatra::Base

    before do
        connection = PG.connect(dbname: 'chitter')
         connection.exec("TRUNCATE peeps;")
      end

    get '/' do
        @peeps =Peeps.view_peeps
        erb :index
      end
    
    post '/add_peep' do
        Peeps.new_peep(name: params[:name], username: params[:username], message: params[:message])
        redirect '/'
    end

      run! if app_file == $0
end