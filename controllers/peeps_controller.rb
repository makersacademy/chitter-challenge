require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database_connection'
require './lib/peeps_repository'
require './lib/user_repository'

class PeepsController < Sinatra::Base
  configure do
    set :views, File.join(__dir__, '..', 'views')
    set :public_dir, File.join(__dir__, '..', 'public')
  end

  before do
    @user_repo = UserRepository.new
    @peeps_repo = PeepsRepository.new(@user_repo)
  end

  
  get '/peeps' do
    @peeps = @peeps_repo.all
    erb :peeps
  end


  get '/peep' do
    erb :peep
  end

  post '/peep' do
    new_peep = Peep.new(
      id: params[:id],
      peep_content: params[:peep_content],
      user_id: session[:user_id],
      time_of_peep: Time.now,
      username: params[:username]
    )
    
    @peeps_repo.create(new_peep)
    
    erb :peep

  # get '/peep/:id' do
  #   @peep = @peeps_repo.find(params[:id])
  #   erb :peep
  # end
end
end