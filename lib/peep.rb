require_relative './database_connection'
require 'uri'

class Peep

  attr_reader :id, :message, :created_at

def initialize(id:, message:, created_at:)
  @id = id
  @message = message
  @created_at = created_at

end


  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    #result.map do |peep|
      # Peep.new(id: peep['id'], message: peep['message'], created_at: peep['created_at'])
    #end
    result.map do |peep|
    Peep.new(
      id: peep['id'],
      message: peep['message'],
      created_at: peep['created_at']  
    )
    end
  end

    def self.create(message:, created_at:)
      #result = DatabaseConnection.query("SELECT * FROM peeps")
      result = DatabaseConnection.query("INSERT INTO peeps (message, created_at) VALUES('#{message}', '#{created_at.strftime("%Y-%m-%d %k:%M")}') RETURNING id, message, created_at;")
    Peep.new(id: result[0]['id'], message: result[0]['message'], created_at: result[0]['created_at'])

   end

   # describe '.create' do
   #   it 'creates new peep' do
   #     peep = Peep.create(message: 'First peep goes here', created_at: Time.now)
   #     persisted_data = persisted_data(table: 'peeps', id: peep.id)
   #
   #     expect(peep).to be_a Peep
   #     expect(peep.id).to eq persisted_data.first['id']
   #     expect(peep.message).to eq 'First peep goes here'
   #   end
   # end

end

#INSERT INTO "public"."peeps" ("title", "id", "created_at", "message") VALUES ('first', DEFAULT, NOW(), 'First peep here!');
