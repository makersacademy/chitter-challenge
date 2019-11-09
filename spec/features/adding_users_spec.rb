feature 'adding users to Chitter' do
  scenario 'it adds a new user to Chitter' do
    visit('/signup')
    fill_in 'name', with: 'Ellie'
    fill_in 'handle', with: 'ellieSMASH'
    fill_in 'email', with: 'eliseaston@gmail.com'
    fill_in 'password', with: 'password123'
    click_button('Create my account')
    expect(page).to have_content('ellieSMASH')
  end
end
