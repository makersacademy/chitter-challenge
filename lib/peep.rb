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
    result.map do |peep|
      Peep.new(id: peep['id'], content: peep['content'], created_at: peep['created_at'])
    end
  end

    def self.create(id:, content:, created_at:)
     result = DatabaseConnection.query("INSERT INTO peeps (content, created_at) VALUES('#{content}', '#{created_at.strftime("%Y-%m-%d %k:%M")}') RETURNING id, content, created_at;")
     Peep.new(id: result[0]['id'], content: result[0]['content'], created_at: result[0]['created_at'])
   end

   describe '.create' do
     it 'creates new peep' do
       peep = Peep.create(content: 'First peep goes here', peep_created_at: Time.now)
       persisted_data = persisted_data(table: 'peeps', id: peep.id)

       expect(peep).to be_a Peep
       expect(peep.id).to eq persisted_data.first['id']
       expect(peep.content).to eq 'First peep goes here'
     end
   end

end

#INSERT INTO "public"."peeps" ("title", "id", "created_at", "content") VALUES ('first', DEFAULT, NOW(), 'First peep here!');
