feature 'I want to be able to sign up for Chitter' do 
	
	scenario 'signing up' do 
		register
		expect(page).to have_content "Hello Rusty!"
	end

	scenario 'signing up with already assigned username ' do 
		register
		visit '/'
		click_link('Register here')
		fill_in('first_name', with: 'Russell')
		fill_in('last_name', with: 'Vaughan')
		fill_in('username', with: 'Rusty')
		fill_in('email', with: 'Rusty@gmail.com')
		fill_in('password', with: 'secert_password123')
		fill_in('password_confirmation', with: 'secert_password123')
		click_button('submit')
		expect(page).to have_content "Username is already taken"
	end

	scenario 'signing up with already assigned email ' do 
		register
		visit '/'
		click_link('Register here')
		fill_in('first_name', with: 'Russell')
		fill_in('last_name', with: 'Vaughan')
		fill_in('username', with: 'Rusty')
		fill_in('email', with: 'Rusty@gmail.com')
		fill_in('password', with: 'secert_password123')
		fill_in('password_confirmation', with: 'secert_password123')		
		click_button('submit')
		expect(page).to have_content "Email is already taken"
	end


  scenario 'requires a matching confirmation password' do
    register
		visit '/'
		click_link('Register here')
		fill_in('first_name', with: 'Russell')
		fill_in('last_name', with: 'Vaughan')
		fill_in('username', with: 'Rusty')
		fill_in('email', with: 'Rusty@gmail.com')
		fill_in('password', with: 'secert_password123')
		fill_in('password_confirmation', with: 'secert_password234')
    expect {click_button('submit')}.not_to change(User, :count)
  end



end