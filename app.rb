require 'sinatra/base'
require_relative './lib/peep.rb'
require 'time'

class ChitterApp < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/new_message' do
    message = params['message']
    time = params['time']
    DatabaseConnection.query("INSERT INTO peeps (message, time) VALUES('#{message}', '#{time}')")
    redirect('/')
  end

  run! if app_file == $0
end
