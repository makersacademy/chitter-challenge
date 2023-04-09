require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps_repository'
require './lib/user_repository'

class PeepsController < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    set :public_folder, 'public'
    set :views, 'views'
    also_reload 'lib/peeps_repository.rb'
  end 

  before do
    @peep_repo = PeepsRepository.new
  end

 post '/peep' do
  new_peep = Peeps.new
  new_peep.peep_content = params[:peep_content] 
  new_peep.time_of_peep = params[:time_of_peep]
  new_peep.user_id = params[:user_id]
  @peep_repo.create(new_peep)
  return erb(:peep)
end


  get '/peeps' do
    return erb(:peeps)
  end

end