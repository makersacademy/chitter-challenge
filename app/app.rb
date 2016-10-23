ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

# require_relative 'server'
# require_relative 'controllers/peeps'
# require_relative 'controllers/sessions'
# require_relative 'controllers/users'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb

  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    @users = User.all
    @peeps = Peep.all
    erb :index
  end

  post '/new_peep' do
    peep = Peep.new(title: params[:title], content: params[:content], created_at: Time.now, user_id: current_user.id)
    peep.save
    redirect('/')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :links
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new
    user = User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if user.save # #save returns true/false depending on whether the model is successfully saved to the database.
      session[:user_id] = user.id
      redirect('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'users/new'
    end
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :index
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/'
  end


  run! if app_file == $0

end
