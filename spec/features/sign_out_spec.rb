feature 'User sign out' do

  let!(:user) do
    User.create(username: 'Lucas',
                email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'while being signed in' do
    sign_in(email: 'user@example.com', password: 'secret1234')
    expect(current_path).to eq '/peeps'
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
