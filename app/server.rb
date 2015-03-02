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

  # Currently having a problem, curious how .erb is different.
  # In my index file, if I haven't passed in the param of a
  # variable I'm using, it throws an undefined local variable message,
  # instead of that variable just being nil.
  # ERB will just treat those undeclared variables as nil
  # Current workaround means that for every page render, I have to
  # pass in all used local variables, and give them a nil value if unused.

  get '/' do
    render 'index', peeps: Peep.all, user: current_user
  end

  get '/users/new' do
    render 'usercreation'
  end

  post '/users' do
    me = ChatterUser.create(name: params[:name], email: params[:email], creation_date: Time.now)
    session[:user_id] = me.id
    redirect '/'
  end


  def current_user
    @current_user ||= ChatterUser.get(session[:user_id]) if session[:user_id]
  end




end
