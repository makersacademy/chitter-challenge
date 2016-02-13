feature 'I want to be able to sign up for Chitter' do 
	
	scenario 'signing up' do 
		visit '/'
		fill_in('first_name', with: 'Russell')
		fill_in('last_name', with: 'Vaughan')
		fill_in('username', with: 'Rusty')
		fill_in('email', with: 'Rusty@gmail.com')
		fill_in('password', with: 'secert_password123')
		click_button('submit')
		expect(page).to have_content "Hello Rusty!"
	end


end