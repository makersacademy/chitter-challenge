feature 'User sign out' do


  let(:user) do
    User.create(name: 'John Doe',
                username: 'john123',
                email:'me@email.com',
                password: 'asd123',
                password_confirmation: 'asd123')
  end

  scenario 'User can sign out' do
    visit '/session/new'
    fill_in :username_or_email, with: user.username
    fill_in :password, with: 'asd123'
    click_button 'Sign in'
    click_button 'Log out'
    expect(page).to have_content('Goodbye')
  end
end
