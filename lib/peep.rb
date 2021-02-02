class Peep

  attr_reader :id, :content, :user

  def initialize(id:, content:, created_at:)
    @id = id
    @content = content
    @user = user
  end

def self.create(id:, content:, created_at:)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end
  connection.exec("INSERT INTO chitter (id, content, user) VALUES('#{id}', '#{content}', '#{created_at}')")
end

def self.feed
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end

  result = connection.exec("SELECT * FROM chitter;")
  result.map do |peep|
        Peep.new(
        id: peep['id'],
        content: peep['text'],
        created_at: peep['created_at'])
      end
end
end
