def sign_up(email: 'email@mail.com', password: 'super secret', password_confirmation: 'super secret' )
  visit '/'
	fill_in 'email', with: email
	fill_in 'password', with: password
	fill_in 'password_confirmation', with: password_confirmation
	click_button 'Sign up'
end

def sign_in(email: 'email@mail.com', password: 'super secret')
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Sign in'
end

def create_message(message: 'hi')
  fill_in 'message', with: message
  click_button 'Submit message'
end

feature 'user sign out' do
	scenario 'sign out message should be displayed' do
    sign_up
    sign_in
    create_message
    click_button 'Sign out'
		expect(page).to have_content 'GoodBye!!'
	end
end
