feature 'Maker can sign up to Chitter' do
  scenario 'visiting the index page' do
    visit '/'
    
    expect(page).to have_content 'Welcome to Chitter'
    fill_in 'name', with: 'Olatunji'
    fill_in 'username', with: 'ola123'
    fill_in 'email', with: 'olatunji@gmail.com'
    fill_in 'password', with: '12345'

    click_button 'sign up'
  end
end
