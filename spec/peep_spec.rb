describe Peep do
	
	subject(:peep){ described_class.create(content: 'A peep', created_at: Time.new(2016,5,8,10,02,02)) }
	context '#created_at_formatted' do
		it 'reformats the time the peep was created at' do
			expect(peep.created_at_formatted).to eq "10:02, Sunday 8 May 2016"
		end
	end

end