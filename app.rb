require 'sinatra/base'
require './lib/peeps/peep'


class Chitter < Sinatra::Base

  get '/' do
    "Hello Peep"
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :"chitter/index"
  end

  post '/signup' do
    user = params['user']
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO user (name) VALUES('#{name}')")
  redirect '/peeps'
    # user = User.create(name: params[:name],
    # email: params[:email],
    # username: params[:username], password: params[:password])
    # session[:user_id] = user.id
    end

  run! if app_file == $0
end
