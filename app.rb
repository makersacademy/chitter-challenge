
require 'sinatra'
require "sinatra/reloader"
require 'bcrypt'
require 'date'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/reply_repository'

DatabaseConnection.connect


class Application < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
    also_reload 'lib/reply_repository'
  end

  get '/' do
    repo = PeepRepository.new
    @signedin = check_login
    @peeps = repo.all.reverse!
    rep = ReplyRepository.new
    @replies = rep.all
    @reply_ids = rep.find_ids
    return erb(:home)
  end

  get '/login' do
    return erb(:login)
  end

  def contain(username_)
    repo = UserRepository.new
    users = repo.all
    users.each do |user|
      if user.username == username_
        return true
      end
    end
    return false
  end

  post '/login' do
    username = params[:username].delete('<>\/')
    password = params[:password].delete('<>\/')

    if username == "" || password == "" || contain(username) == false
      return erb(:fail)
    end

    repo = UserRepository.new
    user = repo.find_by_username(username)


    if BCrypt::Password.new(user.password) == password

      session[:username] = user.username

      repo = PeepRepository.new
      @signedin = check_login
      @peeps = repo.all.reverse!
      rep = ReplyRepository.new
      @replies = rep.all
      @reply_ids = rep.find_ids
      return erb(:home)
    else
      return erb(:fail)
    end
  end

  get '/log_out' do
    session[:username] = nil
    repo = PeepRepository.new
    @signedin = check_login
    @peeps = repo.all.reverse!
    rep = ReplyRepository.new
    @replies = rep.all
    @reply_ids = rep.find_ids
    return erb(:home)
  end

  get '/sign_up' do
    return erb(:sign_up)
  end

  def invalid_request_parameters_signup?(new_user)
    new_user.name == "" || new_user.username == "" || new_user.password == "" || new_user.email == "" || (new_user.password).length < 8 || contain(new_user.username) == true
  end

  post '/sign_up' do

    repo = UserRepository.new
    new_user = User.new
    new_user.name = (params[:name]).gsub(/[^A-Za-z]/, ' ')
    new_user.username = (params[:username]).gsub(/[^0-9A-Za-z]/, '_')
    new_user.email = (params[:email]).delete('<>\/')
    new_user.password = (params[:password]).delete('<>\/')
    if invalid_request_parameters_signup?(new_user)
      status 400
      return erb(:fail)
    end
    repo.create(new_user)
    repo_ = PeepRepository.new
    @signedin = check_login
    @peeps = repo_.all.reverse!
    rep = ReplyRepository.new
    @replies = rep.all
    @reply_ids = rep.find_ids
    return erb(:home)

  end

  get '/new_peep' do
    return erb(:new_peep)
  end

  get '/new_reply/:id' do
    @id = params[:id].delete('<>\/')
    return erb(:new_reply)
  end

  post '/new_peep' do
    repo = PeepRepository.new
    peep = Peep.new
    peep.username = session[:username]
    peep.content = params[:content].delete('<>\/')
    peep.datetime = DateTime.now.strftime('%a, %d %b %y %H:%M:%S')
    repo.create(peep)
    repo_ = PeepRepository.new
    @signedin = check_login
    @peeps = repo_.all.reverse!
    rep = ReplyRepository.new
    @replies = rep.all
    @reply_ids = rep.find_ids
    return erb(:home)
  end

  post '/new_reply/:id' do
    repo = ReplyRepository.new
    reply = Reply.new
    reply.username = session[:username]
    reply.content = params[:content].delete('<>\/')
    reply.datetime = DateTime.now.strftime('%a, %d %b %y %H:%M:%S')
    id = params[:id].delete('<>\/')
    reply.peep_id = id
    repo.create(reply)
    repo_ = PeepRepository.new
    @signedin = check_login
    @peeps = repo_.all.reverse!
    @replies = repo.all
    @reply_ids = repo.find_ids
    return erb(:home)
  end

  get '/replies/:id' do
    peep_id = params[:id].delete('<>\/')
    repo = ReplyRepository.new
    @reps = repo.ids(peep_id)
    repo_ = PeepRepository.new
    @peep = repo_.find(peep_id)
    @signedin = check_login
    return erb(:replies)
  end

  def check_login
    if session[:username] == nil
      return false
    else
      return true
    end
  end

end
