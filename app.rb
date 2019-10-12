require 'sinatra/base'
require 'sinatra/flash'
require 'warden'
require './lib/peep'
require './lib/time_converter'
require './lib/user'

class Chitter < Sinatra::Base
  enable :method_override, :sessions
  register Sinatra::Flash


  get '/' do
    @css_path = 'main.css'
    @page = :index
    erb :template
  end

  get '/sign_up' do
    @css_path = 'main.css'
    @page = :'users/sign_up'
    erb :template
  end

  get '/login' do
    @css_path = 'main.css'
    @page = :'users/login'
    erb :template
  end
  
  get '/home' do
    @peeps = Peep.all.reverse
    @css_path = 'main.css'
    @page = :'home/home'
    erb :template
  end

  post '/peeps' do
    @peep = Peep.create(content: params['peep-content'])
    redirect '/home'
  end

  post '/users' do
    salt = BCrypt::Engine.generate_salt
    passhash = BCrypt::Engine.hash_secret(params[:password], salt)
    @user = User.create(
      handle: params[:handle],
      name: params[:name],
      passhash: passhash,
      salt: salt
    )
    flash[:new_user] = "Thanks for joining Chitter, #{@user.name}! Have a really chit time!"
    redirect '/home'
  end

  post '/sessions' do
    user = User.find_by(handle: params[:handle])
    if user && user.authenticate!(params[:password])
      flash[:login] = "Welcome back, #{user.name}!"
      redirect '/home'
    else
      flash[:fail_login] = "Wrong password!"
      redirect '/'
    end
  end

  # Warden config for authenticated sessions

  # use Warden::Manager do |manager|
  #   manager.default_strategies :password
  #   manager.failure_app = Chitter
  #   manager.serialize_into_session {|user| user.id}
  #   manager.serialize_from_session {|id| Datastore.for(:user).find_by_id(id)}
  # end
  
  # Warden::Manager.before_failure do |env,opts|
  #   env['REQUEST_METHOD'] = 'POST'
  # end

  # Warden::Strategies.add(:password) do
  #   def valid?
  #     params["email"] || params["password"]
  #   end
  
  #   def authenticate!
  #     user = Datastore.for(:user).find_by_email(params["email"])
  #     if user && user.authenticate(params["password"])
  #       success!(user)
  #     else
  #       fail!("Could not log in")
  #     end
  #   end
  # end
end