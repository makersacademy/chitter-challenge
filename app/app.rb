ENV['RACK_ENV'] ||= 'development'

require_relative 'app_setup'

class Chitter < Sinatra::Base

  enable :sessions

  before do
    @user = User.get(session[:current_user_id])
  end

  get '/' do
    redirect '/peeps'
  end

  get '/users' do
    erb(:login)
  end

  get '/users/new' do
    erb(:signup)
  end

  post '/users' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:current_user_id] = user.id
      redirect '/peeps'
    else
      session[:loginerror] = "Email or password incorrect"
      redirect '/users'
    end
  end

  post '/users/new' do
    if User.all.map(&:email).include?(params[:email])
      session[:signuperror] = "Email address already registered"
      redirect '/users/new'
    else
      name = params[:name].capitalize
      email = params[:email]
      password_hash = BCrypt::Password.create(params[:password])
      user = User.create(name: name, email: email, password_hash: password_hash)
      session[:current_user_id] = user.id
      redirect '/peeps'
    end
  end

  get '/logout' do
    session[:current_user_id] = nil
    redirect to '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb(:peeps)
  end

  get '/peeps/new' do
    session[:current_user_id] ? erb(:peep_new) : redirect('/users')
  end

  get '/peeps/filter/:id' do
    @id = params[:id]
    @peeps = User.get(params[:id]).peeps.reverse
    erb(:peeps)
  end

  post '/peeps' do
    peepbody = params[:peepbody]
    Peep.create(body: peepbody, user_id: session[:current_user_id])
    redirect '/peeps'
  end
end
