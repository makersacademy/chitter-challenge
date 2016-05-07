feature 'User can sign out of chitter' do
  let(:user) do
    User.create(name: 'User McUser',
    username: 'alias',
    email: 'user@example.com',
    password: 'secret1234',
    password_confirmation: 'secret1234')
  end

  scenario 'new user sign out' do
    sign_up
    click_button 'Sign out'
    expect(page).to have_content 'Peep to you later!'
  end
  scenario 'old user sign out' do
    sign_in(user.email, user.password)
    click_button 'Sign out'
    expect(page).to have_content 'Peep to you later!'
  end
end
