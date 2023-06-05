require 'mentions'

def reset_chitter_db
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Mentions do
  before(:each) do 
    reset_chitter_db
  end
  
  describe ".find" do
    it "finds an @mention at the start of a Peep" do
      peep = double("Peep", content: "@Eugene Lorem ispum.", time: "2023-03-08 04:05:06", maker_id: 1, maker_name: "Sean")
      expect(Mentions.new.find(peep)).to eq("Eugene")
    end
    
    it "returns nil if there is no @mention in the Peep" do
      peep = double("Peep", content: "Lorem ispum.", time: "2023-03-08 04:05:06", maker_id: 1, maker_name: "Sean")
      expect(Mentions.new.find(peep)).to eq(nil)
    end
  end
  
  describe ".send_notification" do
    it "emails the mentioned Maker" do
      peep = double("Peep", content: "@Eugene Lorem ispum.", time: "2023-03-08 04:05:06", maker_id: 1, maker_name: "Sean", code: 200, body: "Queued. Thank you.")
      result = Mentions.new.send_notification(peep)
      expect(result.code).to eq(200)
      expect(result.body).to include("Queued. Thank you.")
    end
  end
end
