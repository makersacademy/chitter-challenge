feature 'Signing out' do

  before(:each) do

    User.create(name: 'test',
                username: 'test',
                email: 'test@test.com',
                password: '1234',
                password_confirmation: '1234')
  end

  scenario 'User can sign out, while being signed in' do
    sign_in(username: 'test', password: '1234')
    click_button('Sign out')
    expect(page).to have_content('Goodbye')
    expect(page).not_to have_content('Welcome test')
  end

end
