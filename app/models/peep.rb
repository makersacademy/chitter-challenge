class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String, length: 140, required: true
  property :time_posted, Time

  belongs_to :users

  def time
    self.time_posted.strftime("%R %d/%m/%Y")
  end
end

# CREATE TABLE peeps(
#   ID SERIAL PRIMARY KEY,
#   content varchar(140),
#   time_posted Time,
#   users_id varchar(50)
#   );
