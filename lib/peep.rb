class Peep
  def initialize(id:, body:, created_at:, user_id:)
    @id = id
    @body = body
    @created_at = created_at
    @user_id = user_id
  end
  
  def self.all
    response = DatabaseConnection.query("SELECT * FROM peeps")
    response.map { |response| new(id: response['id'], body: response['body'], created_at: response['created_at'], user_id: response['user_id']) }
  end
end
