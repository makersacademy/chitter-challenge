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


feature 'Creating messages' do

  scenario 'I can create a new message' do
    sign_up
    sign_in
    fill_in 'message', with: 'Hi'
    click_button 'Submit message'
    expect(page).to have_content('Hi')
  end
end
