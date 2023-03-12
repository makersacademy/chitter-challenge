require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect


class Application < Sinatra::Base

  enable :sessions
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:home_page)
  end

  # get '/all_peeps' do
  #   repo = PeepRepository
  #   @peeps = repo.all
  # end

  get '/login' do
    return erb(:login)
  end

  get '/account_page' do
    @username = session[:username]
    return erb(:account_page)
  end

  post '/login' do
    email = params[:email]
    password = params[:password]

    repo = UserRepository.new
    if repo.sign_in(email, password)
      @user = repo.find_by_email(email)
      session[:user_id] = @user.id
      session[:email] = @user.email
      session[:username] = @user.username
      return erb(:login_success)
    else
      return erb(:login_error)
    end
  end

  get '/logout' do
    session.clear
    redirect('/')
  end

  get '/new_account' do
    return erb(:new_account)
  end

  post '/new_account' do
    @user = User.new
    @user.name = params[:name]
    @user.username = params[:username]
    @user.password = params[:password]
    confirm_password = params[:password_confirm]
    @user.email = params[:email]

    if @user.password != confirm_password
      return erb(:password_match_fail)
    end

    repo = UserRepository.new
    repo.add_user(@user)
    return erb(:account_page)
  end

  get '/post/new' do
    return erb(:new_post)
  end

  post '/post' do
    if session[:user_id] == nil
      return redirect('/login')
    end
    
    if invalid_request_params?
      status 400
      return ''
    end

    html_regex = /^<([a-z]+)([^>]+)*(?:>(.*)<\/\1>|\s+\/>)$/
    params[:content] = params[:content].gsub(html_regex, '')

    peep = Peep.new
    peep.content = params[:content]
    peep.timestamp = time = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    peep.user_id = session[:user_id].to_i
    repo = PeepRepository.new
    repo.post(peep)

    return erb(:post_success)
  end

  get '/post/:id' do
    id = params[:id]
    repo = PeepRepository.new
    user_repo = UserRepository.new

    peep = repo.find(id)

    @peep_content = peep.content
    @peep_timestamp = peep.timestamp
    @username = user_repo.find(peep.user_id).username
    return erb(:post_view)
  end
end

def invalid_request_params?
  return true if params[:content] == nil 
  return true if params[:content] == ""
  return false
end