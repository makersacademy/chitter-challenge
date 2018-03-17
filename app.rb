require 'sinatra/base'
require_relative './lib/peep.rb'

class ChitterApp < Sinatra::Base
  enable :sessions

  get '/' do
    @messages = Peep.all
    erb(:index)
  end

  post '/new_message' do
    message = params['message']
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
    redirect('/')
  end

  run! if app_file == $0
end
