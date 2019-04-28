feature 'add peeps to chitter' do
  scenario 'user adds a peep' do
    visit '/create_account'
    fill_in 'name', with: "Hannah"
    fill_in 'password', with: "password123"
    fill_in 'email', with: "test@gmail.com"
    click_button 'Create Account'
    visit '/home'
    click_button 'New Peep'
    fill_in 'post', with: "Hello, chitter!"
    click_button 'Post'
    expect(page).to have_content "Hello, chitter!"
  end
end
