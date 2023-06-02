require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/maker_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
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
    return erb(:new_peep)
  end
  
  get '/peep/:id' do
    peep_id = params[:id]
    repo = PeepRepository.new
    @peep = repo.find(peep_id)
    
    return erb(:peep)
  end
  
  post '/peep' do
    @peep = Peep.new
    @peep.content = params[:content]
    @peep.maker_id = params[:maker_id]
    repo = PeepRepository.new
    repo.create(@peep)
    
    return erb(:peep_confirmation)
  end
  
  get '/maker/new' do
    return erb(:new_maker)
  end
  
  post '/maker' do
    @maker = Maker.new
    @maker.name = params['name']
    @maker.email = params['email']
    @maker.password = BCrypt::Password.create(params['password'])
    
    MakerRepository.new.create(@maker)
    return 'Registered!'
  end
  
end
