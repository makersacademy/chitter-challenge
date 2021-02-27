require 'pg'

class Post

    attr_reader :id, :name, :username, :content

    def initialize(id:, name:, username:, content:)
        @id = id
        @name = name
        @username = username
        @content = content
    end
    
    def self.all
        if ENV['ENVIRONMENT'] == 'test' 
            connection = PG.connect :dbname => 'chitter_test'
        else 
            connection = PG.connect :dbname => 'chitter'
        end
        result = connection.exec("SELECT * FROM posts;")
        result.map do |post|
        Post.new(id: post['id'], name: post['name'], username: post['username'], content: post['content'])
        end
    end
        
    def self.create(name:, username:, content:)
        if ENV['ENVIRONMENT'] == 'test' 
            connection = PG.connect :dbname => 'chitter_test'
        else 
            connection = PG.connect :dbname => 'chitter'
        end
        result = connection.exec("INSERT INTO posts (name, username, content) VALUES('#{name}', '#{username}', '#{content}') RETURNING id, name, username, content;")
        Post.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], content: result[0]['content'])
    end
end