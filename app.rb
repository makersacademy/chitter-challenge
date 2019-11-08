require 'sinatra/base'

class Chitter < Sinatra::Base
    enable :sessions
    
    get '/' do
        erb :index
      end
    

    post '/peep' do
        session[:message] = params[:message]
        
    end

run! if app_file == $0
end