
feature 'user can sign out' do
  scenario 'while being signed in' do
    sign_up(email: 'user123@example.com',
	    name: 'John Smith',
	    user_name: 'JohnSmith',
	    password: '1234567',
	    password_confirmation: '1234567')
    sign_in(user_name: 'JohnSmith', password: '1234567')
    click_button('Sign Out')
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, JohnSmith')
  end
end


