require 'data_mapper'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/peep'
require_relative './lib/user'
load './datamapper_setup.rb'


class ChitterApp < Sinatra::Base

  configure do
    use Rack::MethodOverride
    enable :sessions
    register Sinatra::Flash
  end

  helpers do

    def correct_password?(user, password)
      user.password == password
    end

    def set_current_user(user)
      session[:current_user] = user.id
      session[:user_name] = user.user_name
    end

  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    redirect '/sessions/new' unless session[:current_user]
    @peeps = Peep.all(:order => [:created_at.desc]).map { |peep| { peep: peep, user: User.get(peep.user_id) } }
    erb :peeps
  end

  post '/peeps/new' do
    user = User.get(session[:current_user])
    peep = user.peeps.new(text: params[:peep])
    peep.save
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :login
  end

  post '/sessions/new' do
    users = User.all email: params[:email]
    if users.empty?
      flash[:notice] = "Incorrect username"
      redirect '/sessions/new'
    elsif !correct_password?(users.first, params[:password])
      flash[:notice] = "Incorrect password"
      redirect '/sessions/new'
    else
      set_current_user(users.first)
      redirect '/peeps'
    end
  end

  post '/sessions/:id' do
    session.clear
    redirect '/sessions/new'
  end

  get '/users/new' do
    erb :register
  end

  post '/users/new' do
    user = User.create(user_name: params[:username],
                       email: params[:email],
                       password: params[:password]
                      )
    if user.saved?
      set_current_user(user)
      redirect '/peeps'
    else
      flash[:notice] = user.errors.values.first
      redirect '/users/new'
    end
  end

  run! if __FILE__ == $0
end
