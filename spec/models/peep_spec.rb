require './app/data_mapper_setup'

describe Peep do 
	
	it "will have a timestamp on creation" do
		peep = Peep.create(content: 'Testing 123', time: Time.now)
		expect(peep.time.to_s).to eq Time.now.to_s

		# wanted to use this expect (but only supported by rails .second)
		# expect(peep.time).to be_within(1.second).of Time.now

		#Also could utilise the TimeCop gem
	end

  context "Checking that datamapper works" do
    it "can be created and then retrieved from the db" do
      User.create(email: 'ben@test.com', username: '@ben', password: 'password', password_confirmation: 'password')
      user = User.first
      expect(described_class.count).to eq(0)
      described_class.create(content: 'My first peep!',
                             time: Time.now)
      expect(described_class.count).to eq(1)
      peep = described_class.first
      expect(peep.content).to eq('My first peep!')
      peep.destroy
      expect(described_class.count).to eq(0)
    end
  end

end

