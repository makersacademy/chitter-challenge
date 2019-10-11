require 'sinatra/base'

class Peeps < Sinatra::Base

  get '/' do
    "Welcome to Chitter"
  end

  get '/peeps' do
    @peeps = ['This is a test peep', 'This is a test peep 2']
    erb :"peeps/index"
  end

  run if app_file == $0
end
