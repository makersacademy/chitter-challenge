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
    if session[:id].nil?
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
    maker.name = params[:name].strip
    maker.username = params[:username].strip
    maker.email_address = params[:email_address].strip
    maker.password = params[:password].strip

    if signup_param_validation(maker.name, maker.username, maker.email_address, maker.password)
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

    stored_password = BCrypt::Password.new(@maker.password)

    if stored_password == password
      session[:id] = @maker.id
      return erb(:userpage)
    else
      return erb(:login_error)
    end

    # if @maker.password == password
    #   session[:id] = @maker.id
    #   return erb(:userpage)
    # else
    #   return erb(:login_error)
    # end
  end

  get '/userpage' do
    if session[:id].nil?
      return erb(:loginpage)
    else
      repo = MakerRepository.new
      @maker = repo.find(session[:id])
      return erb(:userpage)
    end
  end

  get '/peep/new' do
    if session[:id].nil?
      return erb(:post_peep_no_session)
    else
      return erb(:new_peep)
    end
  end
  
  post '/peep/new' do
    time = Time.new
    repo = PeepRepository.new
    peep = Peep.new
    peep.title = params[:title].strip
    peep.content = params[:content].strip
    peep.date_posted = time
    peep.maker_id = session[:id]
    
    if title_valid?(peep.title)
      status 400
    else
      repo.create(peep)
      return erb(:peep_created)
    end
  end

  get '/delete_peep' do
    if session[:id].nil?
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
      status 400 # add an error stating you cannot delete a peep which you have not posted.
    else
      id = @selected.id
      repo.delete(id)
      return erb(:peep_deleted)
    end
  end

  get '/update_details' do
    if session[:id].nil?
      return erb(:update_no_session)
    else
      return erb(:update_maker)
    end
  end

  post '/update_details' do
    @new_name = params[:name]
    repo = MakerRepository.new
    maker = repo.find(session[:id])
    maker.name = @new_name
    repo.update(maker)
    return erb(:updated_maker)
  end

  get '/logout' do
    session[:id] = nil
    return redirect('/')
  end

  def title_valid?(title)
    repo = PeepRepository.new
    return repo.all.any? { |row| row.title == title } || title.empty? || title.nil?
  end

  def signup_param_validation(name, username, email_address, password)
    repo = MakerRepository.new
    all = [name, username, email_address, password]
    return (repo.all.any? { |row| row.username == username } ||
    repo.all.any? { |row| row.email_address == email_address } || 
    all.any?(nil) || all.any?(&:empty?))
  end
end
