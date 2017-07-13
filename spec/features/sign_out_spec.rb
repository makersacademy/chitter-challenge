feature 'Signing out' do

  before(:each) do
    User.create(email: 'user3@example.com',
                name: 'Example Name3',
                username: 'Username3',
                password: 'examplepass',
                password_confirmation: 'examplepass')
  end

  scenario 'when the user wants to sign out' do
    sign_in(email: 'user3@example.com', password: 'examplepass')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, user3@example.com')
  end
end
