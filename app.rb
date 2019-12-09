require 'sinatra'
require 'sinatra/activerecord'
require_relative 'lib/user'
require_relative 'lib/luv'
require_relative 'lib/peep'
require_relative 'lib/login_information'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'chitter')

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    enable :sessions
    set :views, './lib/views'
  end

  before do
    @current_user = session[:user]
  end

  get '/' do
    @successful_login = session[:successful_login] != false
    erb :login
  end

  post '/log-in' do
    session[:user] = User.where(email: params['email']).first
    session[:successful_login] = LoginInformation.authenticate params['email'], params['password']
    User.log_in session[:user] if session[:successful_login]
    redirect session[:successful_login] ? '/peeps' : '/'
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/new-profile' do
    User.create(
      username: params['new username'], email: params['new email'], password: params['new password']
    )
    redirect '/'
  end

  get '/peeps' do
    erb :index
  end

  post '/send-peep' do
    @current_user.peep params['new-peep'], @current_user.id
    redirect '/peeps'
  end

  post '/handle-luv' do
    peep = Peep.where(id: params.keys.pop).first
    peep.receive_luv @current_user.id, peep.id
    redirect '/peeps'
  end

  get '/profile' do
    erb :profile
  end

  get '/log-out' do
    User.log_out @current_user
    redirect '/'
  end

  run! if app_file == $0
end
