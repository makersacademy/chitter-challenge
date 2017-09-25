feature 'User signs out' do
  before(:each) do
    User.create(email: 'test@test.com',
                password: '1234',
                password_confirmation: '1234')
  end

  scenario 'while being signed in' do
    sign_up(email: 'test@test.com', password: '1234')
    click_button 'SIGN OUT'
    expect(page).to have_content('BLABBER OFF!')
    expect(page).not_to have_content('ONLINE')
  end
end
