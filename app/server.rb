require 'hobbit'
require 'hobbit/contrib'
require 'data_mapper'
require 'rack/protection'
require 'rack-flash'


require_relative 'custom-hobbit'
require_relative 'data_mapper_setup'

class Server < Hobbit::Base
  include Hobbit::Mote
  include Hobbit::Session
  use Rack::Session::Cookie, secret: SecureRandom.hex(64)
  use Rack::Protection
  use Rack::Flash


  get '/' do
    render 'index', peeps: Peep.all, user: current_user
  end

  get '/users/new' do
    temp = ChatterUser.new
    render 'usercreation', user: temp
  end

  # WHY is the session changing for this post?? !! ** !!

  post '/users' do
    puts "** ** #{env['rack.session']['session_id'].inspect}"
    me = ChatterUser.new(name: params[:name], email: params[:email], creation_date: Time.now, password: params[:password], password_confirmation: params[:password_confirmation])
    if me.save
      session[:user_id] = me.id
      redirect '/'
    else
      flash[:notice] = "Passwords did not match."
      p flash
      #puts "** ** #{env['rack.session']['session_id'].inspect}"
      render 'usercreation', user: me
    end
  end

  # It is now my understanding that @current_user is nil at the start of every 'get'
  # or 'post' method above, so that the ||= is irrelevant because the following
  # code is always called.
  # -- Not entirely true, this at least saves method calls from within
  # each individual 'get'/'post' section

  def current_user
    @current_user ||= ChatterUser.get(session[:user_id]) if session[:user_id]
  end



end
