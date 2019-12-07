require 'sinatra'
require 'sinatra/activerecord'
require_relative 'lib/user'
require_relative 'lib/peep'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'chitter')

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    enable :sessions
    set :views, './lib/views'
  end

  before do
    @current_user = session[:user]
    @peeps = Peep
  end

  get '/' do
    erb :login
  end

  post '/log-in' do
    session[:user] = User.where(email: params['email']).first
    redirect '/peeps'
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

  run! if app_file == $0
end
