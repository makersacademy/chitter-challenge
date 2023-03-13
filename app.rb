require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
  end

  before do
    @user_repo = UserRepository.new ; @peep_repo = PeepRepository.new
  end

  get '/' do
    @peeps = @peep_repo.all_peeps ; users = @user_repo.all_users

    name1 = [] ; username1 = [] ; user_id = []

    @status = params[:status]

    p "status in get is #{@status}"

    users.each do |record|
      name1 << record.name ; username1 << record.username
    end

    @peeps.each do |record|
      user_id << record.user_id.to_i
    end

    @name = [] ; @username = []

    user_id.each do |id|
      @name << name1[id - 1]; @username << username1[id - 1]
    end
    return erb(:index)
  end

  get '/peep/:id' do
    peep_id = params[:id]
    peep = @peep_repo.find_peep(peep_id)
    @content = peep.content; @datetime = peep.datetime.split
    user_id = peep.user_id

    user = @user_repo.find_user(user_id)
    @name = user.name; @username = user.username
    return erb(:peep)
  end

  post '/login' do
    email_username = params[:email_username]; password = params[:password]
    exist = @user_repo.find_user(email_username, password)



    if exist != false
      params = {status: true , user: exist}
    else
      params = {status: false , user: nil}
    end

    params = params.map{|key, value| "#{key}=#{value}"}.join("&")

    p "status in post is #{params}"

    return redirect('/')
  end
end