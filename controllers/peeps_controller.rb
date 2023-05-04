class PeepsController < Sinatra::Base
  configure do
    set :views, File.join(__dir__, '..', 'views')
    set :public_dir, File.join(__dir__, '..', 'public')
  end

  before do
    @peeps_repo = PeepsRepository.new(DatabaseConnection.setup('chitter_database'))
  end

  get '/peeps' do
    @peep = @peeps_repo.all # should be @peeps instead of @peep
    erb :peeps
  end

  # Create a new peep

  # get '/peep' do
  #   @peep = @peeps_repo.all
  #   erb :peep
  # end
  
  
  # post '/peep' do
  #   user_id = session[:user_id]
  #   @peep_repo.create(peep_content: params[:peep_content], user_id: user_id)
  #   redirect '/peeps'
  # end

  post '/peep' do
    new_peep = Peep.new
    new_peep.peep_content = params[:peep_content]
    new_peep.time_of_peep = params[:time_of_peep]
    new_peep.user_id = params[:user_id]
    @peeps_repo.create(new_peep)
    erb :peep
  end
  
end

