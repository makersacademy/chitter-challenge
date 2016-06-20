feature 'User signs out' do

  before(:each) do
    User.create(username: 'bob123',
								email: 'bob@bob.com',
								name: 'Bob',
		            password: '12345678',
		            password_confirmation: '12345678')
		end

  scenario 'while being signed in' do
    sign_in(username: 'bob123', password: '12345678')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
