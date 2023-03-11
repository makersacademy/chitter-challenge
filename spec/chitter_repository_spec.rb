
RSpec.describe ChitterRepository do 
    context "tests all method" do
        it "returns all chitter data" do
            repo = ChitterRepository.new
            chitter = repo.all
            expect(chitter).to eq (" ")
        end
    end
end