feature 'post a peep' do
  scenario 'see posted message' do
    visit('/')
    fill_in 'name', with: 'Jon'
    fill_in 'username', with: 'jonny'
    fill_in 'email', with: 'jonny@gmail.com'
    fill_in 'password', with: 'pass123'
    click_button 'Sign up'
    fill_in 'form', with: 'my first peep'
    click_button 'Create new peep'
    expect(page).to have_content 'my first peep'
  end
end
