feature 'user peep' do

	before(:each) do
		sign_up
	end

	scenario 'successful peep' do
		expect { send_peep }.to change(Peep, :count).by(1)
		expect(page).to have_content 'This is a peep'
	end
end