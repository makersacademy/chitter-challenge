require './app/data_mapper_setup'

describe Peep do 

	let!(:peep) { Peep.create(content: 'Testing 123', timestamp: '16.08') }
	
	it "will have a timestamp on creation" do

	end

end