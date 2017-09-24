class Peep
  include DataMapper::Resource

  property :id,           Serial
#  property :name,         String
#  property :user_name,    String
  property :peep_text,    Text, required: true,
                          length: 1..100,
                          messages: {
                            presence: "Peep must not be empty",
                            length: "Peep must not be more than 100 characters"
                          }
  property :created_at,   DateTime

end
