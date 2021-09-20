feature 'peeps' do
	scenario 'post a peep' do
		visit('/')
		fill_in('Message', with: 'first time posting on chitter')
		click_button('Submit')
		expect(page).to have_content 'first time posting on chitter'
	end
end