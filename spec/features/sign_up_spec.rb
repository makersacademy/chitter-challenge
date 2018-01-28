feature 'Display homepage' do
  scenario 'see the options to sign up' do
    visit('/')
    fill_in 'email', with: 'rana@yahoo.com'
    fill_in 'password', with: 'ranalearn'
    fill_in 'name', with: 'Rana Doth'
    click_button 'Submit'
    expect(page).to have_content('Rana Doth')
  end
end
