feature 'Sign Up' do
	scenario 'I can sign up as a new user' do
		expect{sign_up}.to change(User, :count).by(1)
	end
	scenario 'once signed up, page shows me signed in' do
		sign_up
		expect(page).to have_content "Signed in as Riya"
	end
	scenario 'I cannot sign up without an email' do
		expect{sign_up_no_email}.not_to change(User, :count)
		expect(page).to have_content 'Email must not be blank'
	end
	scenario 'I cannot sign up with an invalid email' do
		expect{sign_up_bad_email}.not_to change(User, :count)
		expect(page).to have_content 'Email has an invalid format'
	end
	scenario 'I cannot sign up without a name' do
		expect{sign_up_no_name}.not_to change(User, :count)
		expect(page).to have_content 'Name must not be blank'
	end
	scenario 'I cannot sign up with a non-unique email' do
		sign_up
		expect{sign_up}.not_to change(User, :count)
		expect(page).to have_content 'Email is already taken'
	end
end

feature 'Password Confirmation' do
	scenario 'unable to sign up with different confirmation passowrd' do
		expect{sign_up_wrong_pw}.not_to change(User, :count)
	end
	scenario 'shows error message when pw do not match' do
		sign_up_wrong_pw
		expect(current_path).to eq ('/users/new')
		expect(page).to have_content 'Password does not match the confirmation'
	end
end

