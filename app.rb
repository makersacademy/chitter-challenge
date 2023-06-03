require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/maker_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions
  
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/maker_repository'
  end
  
  get '/' do
    repo = PeepRepository.new
    @peeps = repo.all
    
    return erb(:feed)
  end
  
  get '/peep/new' do
    if session[:maker_id] == nil
      redirect '/maker/login'
    else
      return erb(:new_peep)
    end
  end
  
  get '/peep/:id' do
    peep_id = params[:id]
    repo = PeepRepository.new
    @peep = repo.find(peep_id)
    
    return erb(:peep)
  end
  
  post '/peep' do
    if params[:content].empty?
      @error_message = "You can't Peep nothing, can you? Have another go."
      return erb(:error)
    end
    
    @peep = Peep.new
    @peep.content = params[:content]
    @peep.maker_id = session[:maker_id]
    repo = PeepRepository.new
    repo.create(@peep)

    return erb(:peep_confirmation)
  end
  
  get '/maker/new' do
    return erb(:new_maker)
  end
  
  get '/maker/login' do
    return erb(:login_form)
  end
  
  post '/maker/login' do
    maker = MakerRepository.new.find_by_email(params[:email])
    if maker == nil || params[:email].empty? || params[:password].empty?
      @error_message = "That email address wasn't found."
      status 401
      return erb(:error)
    end
    
    if BCrypt::Password.new(maker.password).is_password? params[:password]
      session[:maker_id] = maker.id
      session[:maker_name] = maker.name
      redirect '/'
    else
      @error_message = "That password wasn't correct."
      status 401
      return erb(:error)
    end
  end
  
  get '/maker/logout' do
    session[:maker_id] = nil
    session[:maker_name] = nil
    redirect '/'
  end
  
  post '/maker' do
    if params[:name].empty? || params[:email].empty? || params[:password].empty?
      @error_message = "Something wasn't right with your registration. Give it another go."
      return erb(:error)
    end
    
    @maker = Maker.new
    @maker.name = params['name']
    @maker.email = params['email']
    @maker.password = BCrypt::Password.create(params['password'])
    
    repo = MakerRepository.new
    repo.create(@maker)
    maker_record = repo.find_by_email(params['email'])
    session[:maker_id] = maker_record.id
    session[:maker_name] = maker_record.name
    redirect '/'
  end
  
end
