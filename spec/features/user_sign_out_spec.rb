feature 'User sign out' do

  before(:each) do
    User.create(username: 'user',
                email: 'hi@email.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'User can sign out of Chitter' do
    sign_in('user', 'test')
    click_button 'Sign out'
    expect(page).to have_content "Welcome Guest"
  end
end
