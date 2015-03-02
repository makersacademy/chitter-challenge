require 'hobbit'
require 'hobbit/contrib'
require 'data_mapper'
require 'rack/protection'


require_relative 'custom-hobbit'
require_relative 'data_mapper_setup'

class Server < Hobbit::Base
  include Hobbit::Mote
  include Hobbit::Session
  use Rack::Session::Cookie, secret: SecureRandom.hex(64)
  use Rack::Protection

  get '/' do
    render 'index', peeps: Peep.all, user: current_user
  end

  get '/users/new' do
    render 'usercreation'
  end

  post '/users' do
    me = ChatterUser.create(name: params[:name], email: params[:email], creation_date: Time.now, password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = me.id
    redirect '/'
  end

  def current_user
    @current_user ||= ChatterUser.get(session[:user_id]) if session[:user_id]
  end




end
