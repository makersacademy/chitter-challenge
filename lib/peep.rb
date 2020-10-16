class Peep
  attr_reader :body, :created_at
  
  def initialize(id:, body:, created_at:, user_id:)
    @id = id
    @body = body
    @created_at = created_at
    @user_id = user_id
  end
  
  def self.all
    response = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created_at DESC")
    response.map { |response| new(id: response['id'], body: response['body'], created_at: convert_time(response['created_at']), user_id: response['user_id']) }
  end

  def self.convert_time(string_time)
    Time.strptime(string_time, '%Y-%m-%d %H:%M:%S%z')
  end
end
