def sign_up(email: 'email@mail.com', password: 'super secret', password_confirmation: 'super secret' )
	visit '/'
	fill_in 'email', with: email
	fill_in 'password', with: password
	fill_in 'password_confirmation', with: password_confirmation
	click_button 'Sign up'
end

feature 'user sign up' do
  scenario 'Incriment users by 1' do
    expect { sign_up }.to change(User, :count).by(1)
	end

	scenario 'requires a matching password confirmation' do
		expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
	end
end
