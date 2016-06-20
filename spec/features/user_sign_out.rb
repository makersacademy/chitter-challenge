feature 'User signs out'

  before(:each) do
  	User.create(name: 'Luke',
                handle: 'lukeaveil',
                email: 'luke@example.com',
                password: '123',
                password_confirmation: '123')
  end

  scenario 'while being signed in' do
    sign_in(email: 'luke@example.com', password: '123')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, luke@exmple.com')
  end

end