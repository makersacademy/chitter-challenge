require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('chitter_test')

class Application < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
  end

  get '/peeps' do
    repo = PeepRepository.new
    @peeps = repo.all_with_user

    return erb(:peeps)
  end

  get '/peeps/new' do
    return redirect('/login') if session[:user_id].nil?
  
    return erb(:create_peep)
  end

  post '/peeps' do
    halt 400, "peep should not be empty" if params[:message].empty?
    
    # prevents dangerous input
    clean_param = Rack::Utils.escape_html(params[:message])

    repo = PeepRepository.new
    peep = Peep.new
    peep.message = clean_param
    peep.user_id = session[:user_id]
    repo.create(peep)
    return redirect('/')
  end

  # get '/peeps/:id' do
  #   # get single peep
  # end

  post '/signup' do
    halt 400, "fields must be completed" if params[:email].empty? || \
    params[:password].empty? || params[:name].empty? || params[:username].empty?

    repo = UserRepository.new
    user = User.new
    user.email = Rack::Utils.escape_html(params[:email])
    user.password = Rack::Utils.escape_html(params[:password])
    user.name = Rack::Utils.escape_html(params[:name])
    user.username = Rack::Utils.escape_html(params[:username])

    repo.create(user)
    return erb(:signup_success)
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    halt 400, "Bad request" unless params[:email].count("'").zero?

    repo = UserRepository.new
    # log_in method returns user id
    user_id = repo.log_in(params[:email], params[:password])
    
    if user_id.nil?
      status 403
      return erb(:login_error)
    else
      session[:user_id] = user_id
      return erb(:login_success)
    end
  end

  get '/logout' do
    session[:user_id] = nil
    
    return redirect('/')
  end
end
