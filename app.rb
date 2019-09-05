require 'sinatra/base'
require './lib/peeps'
require './lib/timestamp'
require './lib/users'

class ChitterApp < Sinatra::Base
  enable :sessions

  get '/chitter' do
    @peeps = Peep.all
    erb :messages
  end

  post '/chitter' do
    @time = Inputtime.timestamp
    @peep = Peep.create(peeps: params['message'],timestamp: @time)

    # connection = PG.connect(dbname: 'chitter_test')
    # connection.exec("INSERT INTO peeps (peeps) VALUES('#{peep}')")
    redirect '/chitter'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    @name = params['name']
    @email = params['email']
    @password = params['password']
    if Users.exist(email:@email).nil?
    @user = Users.create(name:@name,email:@email,password:@password)
    redirect '/welcome'
    else
    @error = true
    # puts "Email has already been taken"
    end
    erb :signup
  end

  get '/signin' do
    erb :signin
  end

  post '/signin' do
    @u_name = params ['name']
    @u_email = params ['email']
    @u_password = params ['password']
  end

  get '/welcome' do
    erb :welcome
  end

  run! if app_file == $0
end
