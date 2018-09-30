require 'rubygems'
require 'data_mapper' # requires all the gems listed above
require 'dm-core'
require 'dm-validations'
require 'dm-migrations'

  # A Postgres connection:
  DataMapper.setup(:default, 'postgres://jamie:@localhost/messages_manager')

  class Post
    include DataMapper::Resource

    property :id,         Serial    # An auto-increment integer key
    property :content,       Text      # A text block, for longer string data.
    property :created_at, DateTime  # A DateTime, for any date you might like.
    belongs_to :user
    has n, :comments
  end

  class Comment
    include DataMapper::Resource

    property :id,         Serial
    property :posted_by,  String
    property :email,      String
    property :url,        String
    property :body,       Text
    property :created_at, DateTime  # A DateTime, for any date you might like.
    belongs_to :post
    # belongs_to :user
  end

  class User
    include DataMapper::Resource

    property :id, Serial
    property :user, Text
    property :firstname, Text
    property :lastname, Text
    property :email, String
    property :password, Text
    has n,   :comments
  end

DataMapper.auto_upgrade!

#   attr_reader :id, :name, :content
#
#   def initialize(id:, name:, content:)
#     @id = id
#     @name = name
#     @content = content
#   end
#
#   def self.all
#     message = connect.exec('SELECT * FROM messages;')
#     message.map do |message|
#       Message.new(
#         id: message['id'],
#         name: message['name'],
#         content: message['content']
#       )
#     end
#   end
#
#   def self.create(name:, content:)
#    result = connect.exec("INSERT INTO messages (name, content) VALUES('#{name}', '#{content}') RETURNING id, name, content;")
#    Message.new(id: result[0]['id'], name: result[0]['name'], content: result[0]['content'])
#  end
#
#   private
#
#   def self.connect
#     if ENV['ENVIRONMENT'] == 'test'
#       return PG.connect dbname: 'messages_manager_test'
#     end
#     PG.connect dbname: 'messages_manager'
#   end
# end
