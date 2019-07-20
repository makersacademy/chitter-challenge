require 'sinatra/base'
require './lib/peep'
require './lib/database_connection_setup'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    @peeps = Peep.all.sort_by(&:time).reverse
    erb :index
  end

  post '/messages' do
    Peep.create(peep: params[:message],
      time: Time.now.strftime("%m/%d/%Y %H:%M:%S"))
    redirect('/')
  end

  get '/registration' do
    erb :registration
  end

  post '/sign_up' do
    User.create(email: params[:email], password: params[:password], username: params[:username])
    redirect('/registration_success')
  end

  get '/registration_success' do
    erb :registration_success
  end

  run! if app_file == $0
end
