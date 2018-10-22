feature 'The user is told if they have entered incorrect login details' do
  scenario 'once they have tried to log in' do
    visit '/'
    fill_in 'username', with: 'billy1'
    fill_in 'password', with: 'passw0rd'
    click_button 'Log in'
    expect(page).to have_content('Incorrect login details, please try again.')
  end
end
