require 'sinatra/base'
require "sinatra/reloader"
require_relative "lib/database_connection"
require './lib/peep_manager'
require './lib/user_repository'


class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep.rb'
    also_reload 'lib/peep_manager.rb'
  end

  before do
    @peep_manager = PeepManager.instance
  end

  get '/signup' do
    
    return erb(:signup)
  end

  post '/signup' do
    @user = UserRepository.new
    return erb(:signup)

  end
    


  get '/' do
    @peeps = @peep_manager.all_peeps

    return erb(:index)
  end

 # get peeps 
 get '/peeps' do
  @peeps = @peep_manager.all_peeps
  return erb(:index)
end

# create new peeps
post '/peeps' do
  @peeps = @peep_manager.all_peeps
  new_peep = Peep.new(params[:username], params[:content].split(','))
  @peep_manager.add_peep(new_peep)

  return erb(:index)
end

end