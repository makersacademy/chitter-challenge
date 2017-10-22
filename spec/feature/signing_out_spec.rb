feature 'signs out' do

  before(:each) do
    Maker.create(email: 'olivia@example.com',
                 password: '12345678',
                 password_confirmation: '12345678')
  end

  scenario 'while being signed in' do
    sign_in(email: 'olivia@example.com', password: '12345678')
    click_button 'Sign out'
    expect(page).not_to have_content('Welcome, olivia@example.com')
  end

end
