def create_user(name,email,username,password,password_confirmation)
	visit('/users')
		expect(page.status_code).to eq 200
		within 'div#sign_up' do
			fill_in :name, with: name
			fill_in :email, with: email
			fill_in :username, with: username
			fill_in :password, with: password
			fill_in :password_confirmation, with: password_confirmation
			click_button "Join Chitter"
		end
end

def sign_in(email,password)
	visit('/users')
	within '#sign_in' do
		fill_in :email, with: email
		fill_in :password, with: password
		click_button 'Sign In'
	end
end

def sign_out
	click_button "Sign Out"
end