class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id,           Serial
  property :peep_text,    Text, required: true,
                          length: 1..100,
                          messages: {
                            presence: "Peep must not be empty",
                            length: "Peep must not be more than 100 characters"
                          }
  property :created_at,   DateTime

  def format_time(time = @created_at)
    "#{time.strftime("%R")} on #{time.strftime("%d/%-m")}"
  end
end
