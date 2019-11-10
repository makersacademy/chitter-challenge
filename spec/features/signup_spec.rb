feature 'sign up for chitter' do
  scenario 'user enters name, username, email and password to sign up' do
    visit('/')
    click_button 'sign up'
    fill_in(:name, with: 'Alex Clifford')
    fill_in(:username, with: 'Clifford2910')
    fill_in(:email, with: '123fake@gmail.com')
    fill_in(:password, with: '123fake')
    click_button 'submit'
    expect(page).to have_content('Chitter Feed:')
  end
end
