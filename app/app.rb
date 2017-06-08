
ENV['RACK_ENV'] ||= 'development'

require 'date'
require 'sun_times'
require 'sinatra/base'
require 'sinatra/flash'
require 'thin'
require_relative './datamapper_setup'
require_relative './../sinatra_helpers/sinatra_helpers.rb'

class Chitter < Sinatra::Base
  include Helpers
  enable :sessions
  set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(20) }

  get '/' do
    @peeps = Peep.all(is_archived: false)
    erb :index
  end

  post '/' do
    redirect '/' unless current_user
    peep = Peep.create(body: params[:body],
    charcount: params[:body].length,
    likes: 0,
    time: Time.now,
    user_id: session[:user_id])
    hashtags = parse_hashtags(peep)
    hashtags.each do |hashtag|
      peep.hashtags << hashtag
      peep.save
    end
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/create_user' do
    user = User.create(first_name: params[:first_name].capitalize,
     last_name: params[:last_name].capitalize,
     email: params[:email].downcase,
     username: params[:username].downcase,
     picture_url: params[:picture_url],
     password: params[:password],
     password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/'
  end

  post '/login' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      erb :index
    end
  end

  get '/logout' do
    redirect '/' unless current_user
    session[:user_id] = nil
    redirect '/'
  end

  get '/peeps/:hashtag' do
    unarchived_peeps = []
    hashtag = Hashtag.all(conditions: ['lower(tag) = ?', params[:hashtag].downcase])
    peeps = hashtag ? hashtag.peeps : []
    peeps.each { |peep| unarchived_peeps << peep unless peep.is_archived == 'true' }
    @peeps = unarchived_peeps
    erb :index
  end

  get '/like/:peep_id' do
    redirect '/' unless current_user
    peep = Peep.get(params[:peep_id])
    peep.likes += 1
    peep.save
    Like.create(peep_id: params[:peep_id], user_id: current_user.id)
  end

  get '/unlike/:peep_id' do
    redirect '/' unless current_user
    peep = Peep.get(params[:peep_id])
    peep.likes -= 1
    peep.save
    like = Like.first(user_id: current_user.id, peep_id: peep.id)
    like.destroy
  end

  post '/archive/:peep_id' do
    redirect '/' unless current_user
    peep = Peep.get(params[:peep_id])
    peep.is_archived = 'true'
    peep.save
    redirect '/'
  end

  get '/archive' do
    redirect '/' unless current_user
    @peeps = Peep.all(user_id: current_user.id, is_archived: true)
    erb :index
  end

  # get '/refactor' do
  #   peeps = Peep.all(user_id: )
  #   peeps.each do |peep|
  #     peep.is_archived = 'false'
  #     peep.save
  #   end
  #   redirect '/'
  # end

  run! if $PROGRAM_NAME == __FILE__
end
