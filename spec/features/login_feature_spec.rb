feature 'As a registered user, I would like login' do 
	
	scenario 'login up' do 
	register 
	visit '/login'
	expect(page.status_code).to eq 200
	fill_in('email', with: 'Rusty@gmail.com')
	fill_in('password', with: 'secert_password123')
	click_button('submit')
	expect(page).to have_content "Welcome to your account!"

	end

end
