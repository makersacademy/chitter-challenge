class Peep

  include DataMapper::Resource

  property :id, Serial
  property :date_time, Time
  property :text, Text,
           required: true,
           message: 'Peeps cannot be empty!'

  belongs_to :user

end