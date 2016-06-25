
feature 'User signs out' do

  before(:each) do
    User.create(name: 'Aday Mesa',
      username: 'adaymesa',
      email: 'adaymesagc@gmail.com',
      password: 'yipiyey!',
      password_confirmation: 'yipiyey!')
  end

  scenario 'During the time signed in' do
    sign_in(username: 'adaymesa', password: 'yipiyey!')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, adaymesa')
  end

end
