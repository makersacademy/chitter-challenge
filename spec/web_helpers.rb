def sign_up
	visit "/"
	expect(page.status_code).to eq 200
	fill_in :email, with: "eleni_s_2015@hotmail.com"
	fill_in :password, with: "Passw0rd"
	fill_in :name, with: "Eleni Skouroupathi"
	fill_in :user_name, with: "Dubai_Girl_15"
	click_button "Sign up"
end


def sign_in(email:, password:)
	visit '/home'
	fill_in 'existing_email', with: email
	fill_in 'existing_password', with: password
	click_button 'Sign in'
end