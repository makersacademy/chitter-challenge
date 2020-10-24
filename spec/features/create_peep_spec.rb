feature 'post peeps' do
  scenario 'User can post messages to chitter and see them displayed' do
    visit '/'
    click_on('Sign up')
    fill_in('name', with: 'Barry')
    fill_in('email', with: 'test@testing.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
    fill_in('newpeep', with: "")
    fill_in('newpeep', with: "This peep is for test purposes. Please do not take it seriously.")
    click_on('Submit')
    expect(page).to have_content "This peep is for test purposes. Please do not take it seriously."
  end
end
