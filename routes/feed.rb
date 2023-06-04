require 'sinatra/base'
require_relative '../lib/repositories/user_repository'
require_relative '../lib/repositories/peep_repository'
require_relative '../lib/repositories/tag_repository'
require_relative '../lib/repositories/reply_repository'
require_relative '../lib/repositories/peep_tag_repository'

class Feed < Sinatra::Base
  enable :sessions
  set :session_secret, "5cdde102f6f68294e1cff23f341aaaaf2d2725453eaccc8ebc239629e724fc53"

  get '/feed' do
    if logged_in?
      @peeps = PeepRepository.all
      @sorted_peeps = PeepRepository.sort_by_timestamp(@peeps)
      @user_repo = UserRepository
      @tag_repo = TagRepository
      @reply_repo = ReplyRepository
      @peep_tag_repo = PeepTagRepository
      erb :feed
    else
      redirect '/login'
    end
  end

  post '/reply' do
    if logged_in?
      content = params[:content]
      user_id = session[:user_id]
      peep_id = params[:peep_id].to_i

      ReplyRepository.create(content, user_id, peep_id)
      redirect '/feed'
    else
      redirect '/login'
    end
  end

  post '/create_peep' do
    if logged_in?
      content = params[:content]
      user_id = session[:user_id]

      PeepRepository.create(content, user_id)

      redirect '/feed'
    else
      redirect '/login'
    end
  end

  get '/user_info/:user_id' do
    user_id = params[:user_id].to_i
    user = UserRepository.find(user_id)
    erb :user_info, locals: { user: user }
  end
  
  private

  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    UserRepository.find(session[:user_id])
  end
end
