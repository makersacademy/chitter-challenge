feature 'sign up' do
  scenario 'user can create peeps after sign up' do
    visit('/')
    fill_in 'name', with: 'Jon'
    fill_in 'username', with: 'jonny'
    fill_in 'email', with: 'jonny@gmail.com'
    fill_in 'password', with: 'pass123'
    click_button 'Sign up'
    expect(page).to have_content 'create peep'
  end
end
