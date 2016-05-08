feature 'User signs out' do
  before(:each) do
    User.create(email: 'harry@smith.com',
    password: '1234', password_confirmation: '1234')
  end
  scenario 'while being signed in' do
    sign_in(email: 'harry@smith.com', password: '1234')
    click_button 'Sign out'
    expect(page).to have content('Goodbye, thanks for sharing your view on Chitter')
    expect(page).to have content('Welcome, harry@smith.com')
  
  end
end
