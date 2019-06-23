require 'sinatra/base'
require 'data_mapper'
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

  # def self.all
  # end

  def publish!
    @published = true
    @created_at = DateTime.today
  end
end

class Chitter < Sinatra::base

#  configure :development do
#    DataMapper.setup(:default, 'postgres://postgres@localhost/chitter_test')
#  end

#  configure :production do
#    DataMapper.setup(:default, 'postgres://postgres@localhost/chitter_development')
#  end

  get '/' do
    @peeps = Peep.all :order => :created_at.desc
    erb :index
  end

  run! if app_file == $0