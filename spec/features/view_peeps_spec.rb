# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'view peeps' do
	
	scenario 'can view a list of all previous peeps' do
		Peep.create(content: 'Hello, chitter!', time: Time.now)

		visit '/peeps'

		expect(page.status_code).to eq 200
		within 'ol#peeps' do
			expect(page).to have_content("Hello, chitter!")
		end
	end

end