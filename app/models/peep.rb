class Peep
  include DataMapper::Resource

  property :id, Serial
  property :text, String, required: true
  property :created_at, DateTime
  property :created_on, Date

  belongs_to :user

  def self.formatted
    peeps = []
    all(order: [:created_at.desc]).each do |message|
      peeps << {
        text: message.text,
        author: User.get(message.user_id).username,
        time: message.created_at.strftime("%a, %e %b %Y %H:%M:%S %z")
      }
    end
    peeps
  end
end
