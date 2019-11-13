require 'sinatra/base'
require 'pg'


class Chitter < Sinatra::Base
    enable :sessions
    
    get "/" do
      
      erb :index
    end
  
    post "/peeps" do
    session[:peep] = params[:peep]
    
    #  peep = params['peeps']
    # connection = PG.connect(dbname: 'chitter_test')
    # connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
    
    end

    get "/new" do
     erb :newpeep
     end

run! if app_file == $0
end