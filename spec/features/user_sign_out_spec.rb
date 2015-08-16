feature 'User signs out' do
  let(:user) do
    User.create(username: 'Teeohbee',
                password: '12345678',
                email: 'toby@example.com',
                password_confirmation: '12345678')
  end

  scenario 'while being signed in' do
    sign_in(email: 'toby@example.com', password: '12345678')
    click_button 'Sign out'
    expect(page).to have_content('You successfully signed out')
    expect(page).not_to have_content('Welcome, Teeohbee')
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Sign in'
  end
end
