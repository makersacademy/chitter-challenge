feature 'posting peeps' do 
	
		before(:each) do 
		User.create(name: 'Edu',
			mail: 'hedu.delgado',
			password: 'secretin',
			password_confirmation: 'secretin')
	end
	scenario 'I can post a peep' do 
		sign_in(mail: 'hedu.delgado',
			password: 'secretin')
		fill_in :peep, with: 'welcome to my app!'
		click_button 'Post'
	end
	scenario 'I can see peeps posted on the wall' do
		sign_in(mail: 'hedu.delgado',
			password: 'secretin')
		fill_in :peep, with: 'welcome to my app!'
		click_button 'Post'
		expect(page.status_code).to eq 200
		expect(page).to have_content('welcome to my app!')
	end
end