feature 'view peeps' do
  scenario 'user is able to see all the peeps' do
    visit('/')
    fill_in 'name', with: 'Jon'
    fill_in 'username', with: 'jonny'
    fill_in 'email', with: 'jonny@gmail.com'
    fill_in 'password', with: 'pass123'
    click_button 'Sign up'
    fill_in 'form', with: 'my first peep'
    click_button 'Create new peep'
    fill_in 'form', with: 'my second peep'
    click_button 'Create new peep'
    expect(page).to have_content 'my first peep'
    expect(page).to have_content 'my second peep'
  end
end
