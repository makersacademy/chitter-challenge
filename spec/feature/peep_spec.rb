

feature 'viewing peeps' do 
	scenario 'I can see a list of peeps' do
		Peep.create(username: 'Fareed', chitter: 'I am such a peeper')

		visit '/peeps'

		#the following expectation checks that everything is working.	
		( expect(page.status_code).to eq 200 ) 
		within 'ul#peeps' do
		expect(page).to have_content('username: Fareed chitter: I am such a peeper')
		end
	end
end

