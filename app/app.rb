ENV['RACK_ENV'] ||= 'development'

require_relative 'app_setup'

class Chitter < Sinatra::Base

  enable :sessions

  before do
    @user = session[:current_user]
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
    if User.all.map{|user| user.email}.include? params[:email]
      if User.first(:email => params[:email]).password == params[:password]
        session[:current_user] = User.first(:email => params[:email])
        redirect '/peeps'
      end
    end
    redirect '/users'
  end

  post '/users/new' do
    name = params[:name]
    email = params[:email]
    password = params[:password]
    User.create(name: name, email: email, password: password)
    redirect '/users'
  end

  get '/logout' do
    session[:current_user] = nil
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb(:peeps)
  end

  get '/peeps/new' do
    session[:current_user] ? erb(:peep_new) : redirect('/users')
  end

  post '/peeps' do
    peepbody = params[:peepbody]
    user = session[:current_user]
    Peep.create(body: peepbody, user_id: user.id)
    redirect '/peeps'
  end
end
