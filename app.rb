require 'sinatra/base'
require 'data_mapper'
require 'pg'
load 'db.rb'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :peeps

end

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :published, Boolean, default: false
  property :created_at, DateTime
  
  belongs_to :user

  def publish!
    @published = true
    @created_at = DateTime.today
  end
end

class Chitter < Sinatra::Base
  enable :sessions, :method_override
#  configure :development do
#    DataMapper.setup(:default, 'postgres://postgres@localhost/chitter_test')
#  end

#  configure :production do
#    DataMapper.setup(:default, 'postgres://postgres@localhost/chitter_development')
#  end

  get '/' do
    erb :welcome
  end

  get '/register' do
    erb :register
  end

  post '/users' do
    @user = User.create(name: params[:username])
    session[:id] = @user.id
    redirect '/user_success'
  end

  get '/user_success' do
    id = session[:id]
    @user = User.get(id)
    erb :user_success
  end

  get '/peeps' do
    @peeps = Peep.all :order => :created_at.desc
    erb :index
  end

  run! if app_file == $0
end