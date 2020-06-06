require "sinatra/base"
require "pg"

class Chitter < Sinatra::Base

    get '/' do
      erb :index
    end

    post '/peeps/new' do
      Peep.create(message: params[:message])
    #   connection = PG.connect(dbname: 'peeps_manager_test')
    #   connection.exec("INSERT INTO peeps (message) VALUES(#{message})")
      redirect '/peeps'
    end

    get '/peeps' do
      @peeps = Peep.all
      erb :peeps
    end


  run! if app_file == $0
end
