require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/peeps' do
    @peeps = []
    erb :'peeps/index'
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = [
          "Hello",
          "Ciao ragazzi",
          "I love coding weekends"
         ]
    # peeps.join(" ")
    erb :'peeps/index'
    # @peeps = Peep.all
    # p @peeps
    # p "printing peeps above"
  end



  run! if app_file == $0
end
