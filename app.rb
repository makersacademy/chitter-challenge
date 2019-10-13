require_relative './config/environment.rb'
require_relative 'app/models/init'
require_relative 'app/helpers/init'

class Chitter < Sinatra::Base
  enable :method_override, :sessions
  register Sinatra::Flash
  
  get '/' do
    @root = ""
    @css_path = @root + 'main.css'
    @logo = @root + 'CHITTERwhite_large.jpeg'
    @page = :index
    erb :template
  end
  
  get '/home' do
    @root = ""
    @logo = @root + 'CHITTERwhite_large.jpeg'
    @css_path = @root + 'main.css'
    @user = warden_handler.user if warden_handler.authenticated?
    @tags = @user.tags if @user
    @peeps = Peep.parents.reverse if Peep.parents != nil
    @directory = :'home/peeps'
    @page = :'home/home'
    erb :template
  end

  get '/sign_up' do
    @root = ""
    @css_path = @root + 'main.css'
    @logo = @root + 'CHITTERwhite_large.jpeg'
    @form = :'forms/sign_up'
    @page = :'users/login_signup'
    erb :template
  end
  
  get '/login' do
    @root = ""
    @css_path = @root + 'main.css'
    @logo = @root + 'CHITTERwhite_large.jpeg'
    @form = :'forms/login'
    @page = :'users/login_signup'
    erb :template
  end
  
  get '/peeps/:id/reply' do
    @root = ""
    @css_path = @root + 'main.css'
    @logo = @root + 'CHITTERwhite_large.jpeg'
    @reply_id = params[:id].to_i
    @user = warden_handler.user
    @tags = @user.tags
    @peeps = Peep.parents.reverse if Peep.parents
    @css_path = '../../main.css'
    @directory = :'home/peeps'
    @page = :'home/home'
    erb :template
  end
  
  get '/users/:id/tags' do
    @root = "../../"
    @css_path = @root + 'main.css'
    @logo = @root + 'CHITTERwhite_large.jpeg'
    @user = warden_handler.user
    @tags = @user.tags
    read_tags
    @directory = :'users/tags'
    @page = :'home/home'
    erb :template
  end

  post '/peeps' do
    check_params
    @peep = Peep.create(
      content: params['peep-content'],
      user_id: warden_handler.user.id
    )
    Tag.check(@peep)
    redirect '/home'
  end

  post '/peeps/:id/replies' do
    peep = Peep.create(
      content: params['reply'],
      user_id: warden_handler.user.id,
      parent_id: params[:id]
    )
    redirect '/home'
  end

  post '/users' do
    unless user_valid?
      flash[:sign_up_fail] = "Please fill all the fields!"
      redirect '/sign_up'
    end
    user = User.create(
      handle: "@#{params[:handle]}",
      name: params[:name],
      email: params[:email]
    )
    UserPassword.set(user, params[:password])
    redirect('/sessions', 307)
  end
  
  post '/sessions' do
    warden_handler.authenticate!
    if warden_handler.authenticated?
      set_flash
      redirect '/home'
    else
      redirect '/'
    end
  end
  
  post '/unauthenticated' do
    flash[:fail_login] = "Wrong password!"
    redirect '/'
  end

  delete '/sessions' do
    warden_handler.logout
    redirect '/'
  end

  # Warden config for user authentication

  use Warden::Manager do |manager|
    manager.default_strategies :password
    manager.failure_app = Chitter
    manager.serialize_into_session {|user| user.id}
    manager.serialize_from_session {|id| User.find_by_id(id)}
  end

  Warden::Manager.before_failure do |env,opts|
    env['REQUEST_METHOD'] = 'POST'
  end

  Warden::Strategies.add(:password) do
    def valid?
      params["email"] || params["password"]
    end

    def authenticate!
      user = User.find_by(email: params['email'])
      if user && user.authenticate(params["password"])
        success!(user)
      else
        fail!("Could not log in")
      end
    end
  end
end