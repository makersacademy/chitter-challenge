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
            expect(@contents).to eq (" ")
        end
    end
end