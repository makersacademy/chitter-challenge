require 'bcrypt'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require_relative 'lib/database_connection'
require_relative 'lib/email_sender'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
  end

  get '/' do
    peep_repo = PeepRepository.new
    peeps = peep_repo.all
    @peeps = peeps.sort_by(&:time_posted).reverse

    user_repo = UserRepository.new
    @peeps.each { |peep| peep.user = user_repo.find(peep.user_id) }
    @user = session[:user_id].nil? ? nil : user_repo.find(session[:user_id])

    erb(:index)
  end

  get '/login' do
    erb(:login)
  end

  get '/sign-up' do
    erb(:sign_up)
  end

  get '/new-peep' do
    return redirect('/login') if session[:user_id].nil?
    erb(:new_peep)
  end
  
  get '/logout' do
    session[:user_id] = nil
    return redirect('/')
  end

  post '/login' do
    repo = UserRepository.new
    email = params[:email]
    password = params[:password]

    unless input_valid?(email) && input_valid?(password) && repo.email_exists?(email)
      status 400
      return erb(:login_failure)
    end

    unless repo.correct_password?(email, password)
      status 400
      return erb(:login_failure)
    end

    @user = repo.find_by_email(email)
    session[:user_id] = @user.id
    return erb(:login_success)
  end
  
  post '/sign-up' do
    unless params.values.all? { |input| input_valid?(input) }
      status 400
      return erb(:sign_up_failure)
    end
    
    repo = UserRepository.new

    if repo.email_exists?(params[:email]) || repo.username_exists?(params[:username])
      status 400
      return erb(:sign_up_failure) 
    end

    user = get_user_from_params(params)
    repo.create(user)
    return erb(:sign_up_success)
  end

  post '/new-peep' do
    unless params.values.all? { |input| input_valid?(input) }
      status 400
      return erb(:new_peep_failure)
    end

    repo = PeepRepository.new
    peep = get_peep_from_params(params)
    repo.create(peep)

    email_tagged_users(peep)
    erb(:new_peep_success)
  end

  private

  def get_user_from_params(params)
    user = User.new
    user.email = params[:email]
    user.password = params[:password]
    user.name = params[:name]
    user.username = params[:username]
    user
  end

  def get_peep_from_params(params)
    peep = Peep.new
    peep.content = params[:content]
    peep.time_posted = params[:time_posted] || Time.new
    peep.user_id = session[:user_id]
    peep
  end

  def email_tagged_users(peep)
    users = get_tagged_users(peep)
    return if users.nil?
    
    users.each do |user|
      email_sender = EmailSender.new(
        user.email,
        '<html>You have been tagged in a peep!</html>'
      )
      email_sender.send_email
    end
  end
  
  def get_tagged_users(peep)
    words = peep.content.split
    tags = words.select { |word| word.start_with?("@") }
    usernames = tags.map { |tag| tag[1..] }

    repo = UserRepository.new

    users = []
    usernames.each do |username|
      user = repo.find_by_username(username)
      users << user unless user.nil?
    end
    users
  end

  def input_valid?(input)
    input != '' && !input.match(/[<>]/)
  end
end
