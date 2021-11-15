require 'peep'
require 'timecop'
require 'active_support/all'

describe Peep do

	it "creates a new peep" do
		user = double("user", :id => 1)
		new_peep = Peep.create("Its a fine day to be a Maker", user.id)
		expect(Peep.all.first.message).to eq "Its a fine day to be a Maker"
	end

	it "saves the time a peep was made" do
		Timecop.freeze(Time.local(2021).to_formatted_s(:db))
		user = double("user", :id => 1)
		new_peep = Peep.create("Its a fine day to be a Maker", user.id)
		expect(Peep.all.first.time).to eq Time.local(2021).to_formatted_s(:db)
	end

end
