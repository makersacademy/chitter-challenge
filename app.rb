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

  get '/all_peeps' do
    repo = PeepRepository.new
    @peeps = repo.all.reverse
    return erb(:all_peeps)
  end

  get '/login' do
    return erb(:login)
  end

  get "/logged_in_home" do
    if session[:user_id] != nil
      return erb(:logged_in_home)
    else
      redirect('/login')
    end
  end

  get '/account_page' do
    if session[:user_id] != nil
      @username = session[:username]
      return erb(:account_page)
    else
      redirect('/login')
    end
  end

  post '/login' do
    if invalid_request_params?([:email, :password])
      status 400
      return ''
    end

    html_regex = /^<([a-z]+)([^>]+)*(?:>(.*)<\/\1>|\s+\/>)$/
    params[:email] = params[:email].gsub(html_regex, '')
    params[:password] = params[:password].gsub(html_regex, '')
   
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
    if invalid_request_params?([:name, :username, :password, :password_confirm, :email])
      status 400
      return ''
    end

    @user = User.new
    # sanitize user input 
    html_regex = /^<([a-z]+)([^>]+)*(?:>(.*)<\/\1>|\s+\/>)$/
    params[:name] = params[:name].gsub(html_regex, '')
    params[:username] = params[:username].gsub(html_regex, '')
    params[:password] = params[:password].gsub(html_regex, '')
    params[:password_confirm] = params[:password_confirm].gsub(html_regex, '')
    params[:email] = params[:email].gsub(html_regex, '')

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
    return redirect('/login')
  end

  get '/post/new' do
    if session[:user_id] != nil
      return erb(:new_post)
    else
      redirect('/login')
    end
  end

  post '/post' do
    if session[:user_id] == nil
      return redirect('/login')
    end
    
    if invalid_request_params?([:content])
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

def invalid_request_params?(param_names)
  param_names.each do |param|
    return true if params[param] == nil 
    return true if params[param] == ""
  end
  return false
end

def input_sanitation(param_names)
  html_regex = html_regex = /^<([a-z]+)([^>]+)*(?:>(.*)<\/\1>|\s+\/>)$/
  param_names.each do |param|
    params[param] = params[param].gsub(html_regex, '')
  end

end