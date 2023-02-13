require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
  end

  get '/' do 
    return erb(:homepage)
  end 

  get '/show_peeps' do 
    peep_repo = PeepRepository.new
    user_repo = UserRepository.new
    @users = user_repo.all
    all_peeps = peep_repo.all
    @sorted_peeps = peep_repo.sort_peeps(all_peeps)
    
    return erb(:show_peeps)
  end 

  get '/peeps/post' do 
  end 

end

repo = PeepRepository.new
all_peeps = repo.all
@sorted_peeps = repo.sort_peeps(all_peeps)

puts @sorted_peeps