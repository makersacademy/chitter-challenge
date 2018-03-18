require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/user.rb'
require_relative 'lib/database_connection_setup.rb'
require_relative 'lib/instance.rb'
require_relative 'lib/peep.rb'

class Chitter < Sinatra::Base

  configure do
     set :public_folder, File.expand_path('../public', __FILE__)
     set :views        , File.expand_path('../views', __FILE__)
     set :root         , File.dirname(__FILE__)
   end

  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect('/chitter/index')
  end

  get '/chitter/index' do
    erb(:'/chitter/index')
  end

  post '/chitter/signup' do
    user = User.create(params[:email], params[:password])
    if user == 0 
      flash[:notice] = "Incorrect format"
      redirect('/chitter/index')
    elsif user == 1
      flash[:notice] = "User already exists"
      redirect('/chitter/index')
    else
      session[:message] = params[:email]
      redirect('/chitter/signup')
    end
  end
  
  get '/chitter/signup' do
    @email = session[:message]
    erb(:'/chitter/signup')
  end

  post '/chitter/content' do
    if Instance.login(params[:email], params[:password]) != false
      session[:message] = params[:email]
      redirect('/chitter/content')
    else
    flash[:notice] = "Combination not found"
      redirect('/chitter/index')
    end
  end

  get '/chitter/content' do
    @email = session[:message]
    @peeps = Peep.all
    erb(:'/chitter/content')
  end

  post '/chitter/:email/logout' do
    Instance.logout(params[:email])
    redirect('chitter/index')
  end

  post '/chitter/:email/peep' do
    redirect('/chitter/peep')
  end

  get '/chitter/:email/peep' do
    @email = params[:email]
    erb(:'/chitter/peep')
  end

  post '/chitter/:email/submit' do
    Instance.email(params[:peep])
    user = User.find(params[:email])
    user.post(params[:peep])
    redirect('/chitter/content')
  end

  run! if app_file == $0

end


