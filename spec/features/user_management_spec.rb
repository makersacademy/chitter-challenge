feature 'User sign-up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, pete@example.com')
    expect(User.first.email).to eq('pete@example.com')
  end

  scenario 'password confirmation doesnt match' do
    visit '/users/new'
    fill_in 'name', with: 'Pete Smith'
    fill_in 'email', with: 'pete@example.com'
    fill_in 'username', with: 'peteypops'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'notmatching'
    expect{click_button 'Sign up'}.not_to change(User, :count)
  end
end
