require 'pg'

class Peep
  attr_reader :id, :content, :user_id

  def initialize(id, content, user_id)
    @id = id
    @content = content
    @user_id = user_id
  end

  def self.post(text)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_manager_test')
                 else
                   PG.connect(dbname: 'chitter_manager')
                 end
    connection.exec("INSERT INTO peeps (content) VALUES('#{text}');")
  end


end
