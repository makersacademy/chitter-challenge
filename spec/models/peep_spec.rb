require './app/data_mapper_setup'

describe Peep do 
	
	it "will have a timestamp on creation" do
		peep = Peep.create(content: 'Testing 123', time: Time.now)
		expect(peep.time.to_s).to eq Time.now.to_s

		# wanted to use this expect (but only supported by rails .second)
		# expect(peep.time).to be_within(1.second).of Time.now

		#Also could utilise the TimeCop gem
	end

end