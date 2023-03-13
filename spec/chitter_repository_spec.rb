require 'chitter_repository'
require 'chitter'
def reset_chitters_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitters' })
    connection.exec(seed_sql)
end
  
describe ChitterRepository do
    before(:each) do 
      reset_chitters_table
    end
  
    # (your tests will go here).
end

RSpec.describe ChitterRepository do 
    context "tests all method" do
        it "returns all chitter data" do
            repo = ChitterRepository.new
            chitter = repo.all
            @contents = []
            chitter.each do |content|
                @contents.push(content.contents)
            end
            expect(@contents).to eq ["Hey guys happy monday", "Happy monday to you too!", "Did you have any breakfast?", "Yea I had some chocolate", "good day to you all", "good day to you all", "create test", "create test"]
        end
        it "returns all chitter dates" do
            repo = ChitterRepository.new
            chitter = repo.all
            @contents = []
            chitter.each do |content|
                @contents.push(content.time)
            end
            expect(@contents).to eq ["1.13", "2.14", "3.25", "3.25", "12.46", "12.46", "12.46","12.46"]
        end
        it "returns all chitter id" do
            repo = ChitterRepository.new
            chitter = repo.all
            @id = []
            chitter.each do |content|
                @id.push(content.id)
            end
            expect(@id).to eq ["1", "2", "3", "4", "5", "6", "7","8"]
        end
        it "returns all chitter user_id" do
            repo = ChitterRepository.new
            chitter = repo.all
            @id = []
            chitter.each do |content|
                @id.push(content.user_id)
            end
            expect(@id).to eq ["1", "2", "3", "4", "2", "2", "2","2"]
        end

    end
    context "tests find method" do
        it "returns exact chitter" do
            repo = ChitterRepository.new
            chitter = repo.find(2)
            expect(chitter.contents).to eq("Happy monday to you too!")
            expect(chitter.time).to eq("2.14")
            expect(chitter.id).to eq("2")
        end
    end

end