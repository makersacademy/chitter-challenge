feature 'user can sign up' do
  scenario 'user can register their details' do
    visit('/sign_up')
    fill_in 'name', with: 'Pingu Penguin'
    fill_in 'username', with: 'Pingu'
    fill_in 'email', with: 'pingu@penguin.co.uk'
    fill_in 'password', with: 'Pingu'
    click_on 'Register'

    expect(page).to have_content 'Welcome Pingu'

  end

end