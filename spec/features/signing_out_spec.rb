feature 'User signs out' do

  before(:each) do
    User.create(email: 'bkluczynski@gmail.com',
                name: 'Bart',
                username: 'bartklu',
                password: '12345',
                password_confirmation: '12345')
    end

  scenario 'while being signed in' do
    log_in(email: 'bkluczynski@gmail.com', password: '12345')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, kluczynskib@gmail.com')
  end

end
