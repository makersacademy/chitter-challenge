require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './scripts/setup_db'
require './lib/user'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.create(name: 'My_name', username: 'My_username', email: 'someemail@gmail.com', password: 'fefwefwe')
    @peeps = [
      Peep.create(user_id: @user.id , peep: "Hello world"),
      Peep.create(user_id: @user.id,  peep: "Hello world - This is John"),
      Peep.create(user_id: @user.id, peep: "Hello world - This is Mike"),
    ]
    erb :peeps
  end

  #run! if app_file = $0
end