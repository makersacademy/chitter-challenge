require 'sinatra/base'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('chitter')

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository.rb'
    also_reload 'lib/peep_repository.rb'
  end

  $logged_in = false
  $current_user = User.new
  $current_user.username = "default_user"
  $current_user.full_name = "Default User"

  get '/' do
    p $logged_in
    peep_repo = PeepRepository.new
    @peeps = peep_repo.all.reverse

    return erb(:index)
  end

  get '/register' do
    return erb(:register)
  end

  get '/logged-out' do
    $logged_in = false
    return redirect('/')
  end

  get '/log-in' do
    return erb(:log_in)
  end

  post '/peeps' do
    if security_risk?
      status 400
      return "Error: Illegal characters used"
    end
    
    new_peep = Peep.new
    new_peep.content = params[:content]
    new_peep.time = Time.now
    new_peep.author_username = $current_user.username
    new_peep.author_full_name = $current_user.full_name
    new_peep.author_user_id = $current_user.id

    peep_repo = PeepRepository.new
    peep_repo.create(new_peep)

    return redirect('/')
  end

  post '/log-in' do
    user = User.new
    user.username = params[:username]
    user.pass = params[:pass]

    user_repo = UserRepository.new
    registered_users = user_repo.all

    registered_users.each do |registered_user|
      if registered_user.username == params[:username]
        if registered_user.pass == params[:pass]
          $current_user = registered_user
          $logged_in = true
          return redirect('/')
        end

        status 400
        return "Error: Incorrect password for #{params[:username]}"
      end
    end

    status 400
    return "Error: Username not found"
  end

  post '/register' do
    new_user = User.new
    new_user.full_name = params[:full_name]
    new_user.email = params[:email]
    new_user.username = params[:username]
    new_user.pass = params[:pass]

    user_repo = UserRepository.new
    registered_users = user_repo.all

    registered_users.each do |registered_user|
      if registered_user.username == new_user.username
        status 400
        return "Error: username already exists"
      end

      if registered_user.email == new_user.email
        status 400
        return "Error: email address already in use"
      end
    end

    user_repo.create(new_user)

    return redirect('/')
  end

  private

  def security_risk? 
    banned_chars = ['<','>','/']
    banned_chars.any? { |banned_char| params[:content].include?(banned_char) }
  end
end
