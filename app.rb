require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep_repository'
require_relative 'lib/maker_repository'
require_relative 'lib/database_connection'

DatabaseConnection.connect

class Application < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/maker_repository'
    also_reload 'lib/peep_repository'
  end

  get '/' do
    return erb(:homepage)
  end

  get '/peeps' do
    peep_repo = PeepRepository.new
    @maker_repo = MakerRepository.new
    @all_peeps = peep_repo.all.sort_by(&:date_posted).reverse
    return erb(:peeps)
  end

  get '/peeps/:id' do
    if session[:id] == nil
      return erb(:user_peeps_no_session)
    else
      peep_repo = PeepRepository.new
      maker_repo = MakerRepository.new
      @maker = maker_repo.find(session[:id])
      @makers_peeps = peep_repo.by_maker(session[:id]).sort_by(&:date_posted).reverse
      return erb(:user_peeps)
    end
  end

  get '/signup' do
    return erb(:signuppage)
  end

  post '/signup' do
    repo = MakerRepository.new
    maker = Maker.new
    maker.name = params[:name]
    maker.username = params[:username]
    maker.email_address = params[:email_address]
    maker.password = params[:password]

    if repo.all.any? { |row| row.username == maker.username }
      status 400
    elsif repo.all.any? { |row| row.email_address == maker.email_address }
      status 400
    elsif maker.name == nil || maker.username == nil || maker.email_address == nil || maker.password == nil
      status 400
    elsif maker.name.empty? || maker.username.empty? || maker.email_address.empty? || maker.password.empty? 
      status 400
    else
      repo.create(maker)
      redirect '/loginpage'
    end
  end

  get '/loginpage' do
    return erb(:loginpage)
  end

  post '/loginpage' do
    username = params[:username]
    password = params[:password]
    repo = MakerRepository.new
    @maker = repo.find_by_username(username)
    
    if @maker.password == password
      session[:id] = @maker.id
      return erb(:userpage)
    else
      return erb(:login_error)
    end
  end

  get '/userpage' do
    if session[:id] == nil
      return erb(:loginpage)
    else
      repo = MakerRepository.new
      @maker = repo.find(session[:id])
      return erb(:userpage)
    end
  end

  get '/peep/new' do
    if session[:id] == nil
      return erb(:post_peep_no_session)
    else
      return erb(:new_peep)
    end
  end
  
  post '/peep/new' do
    time = Time.new
    repo = PeepRepository.new
    peep = Peep.new
    peep.title = params[:title]
    peep.content = params[:content]
    peep.date_posted = time
    peep.maker_id = session[:id]
    repo.create(peep)

    # If title already exists add fail

    return erb(:peep_created)
  end

  get '/delete_peep' do
    if session[:id] == nil
      return erb(:delete_no_session)
    else
      return erb(:delete_peep)
    end
  end

  post '/delete_peep' do
    title = params[:title]
    repo = PeepRepository.new
    @selected = repo.find_by_title(title)

    if @selected.maker_id != session[:id]
      status 400 #add an error stating you cannot delete a peep which you have not posted.
    else
      id = @selected.id 
      repo.delete(id)
      return erb(:peep_deleted)
    end
  end

  get '/update_details' do
   
  end

  post '/update_details' do

  end

  get '/logout' do
    session[:id] = nil
    return redirect('/')
  end
end
