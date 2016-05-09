

feature 'listing peeps' do 
	scenario 'so I can add peeps' do 
		visit '/peeps/new'

		fill_in('username', with: 'fareed')
		fill_in('chitter', with: 'I am such a peeper')

		click_button "submit"
		expect(page).to have_content "username: fareed chitter: I am such a peeper"

	end
end