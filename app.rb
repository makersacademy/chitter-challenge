require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('chitter_test')

class Application < Sinatra::Base
 
  use Rack::Session::Pool


  configure :development do
    
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get '/' do 
    repo_peep = PeepRepository.new
    @peeps = repo_peep.all
    erb :index
  end


  get '/sign_in' do 
    return erb(:sign_in)
  end

  get '/log_in' do 
    return erb(:log_in)
  end

   get '/new_peep' do
    return erb(:new_peep)
  end

  post '/new_peep' do 
    repo = PeepRepository.new
    peep = Peep.new
    peep.message = params[:message]
    peep.date = params[:date]
    peep.user_id = params[:user_id]
    
    
    repo.add(peep)
    return erb(:peep_added)
  end 

  post '/log_in' do 
    repo = UserRepository.new
    user = User.new
    existing_user = repo.find(params[:email])
    if existing_user.email == params[:email] && existing_user.password == params[:password]
      return erb(:log_in_succes)
    else
      return erb(:log_in_unsuccesful)
    end
    
  end 

  post '/sign_in' do 
    repo = UserRepository.new
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    id = repo.sign_in(@user)
    session[:user_id] = id
    session[:name] = params[:name]
    return erb(:sign_in_succes)
  end
end