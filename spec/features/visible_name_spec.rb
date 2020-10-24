feature 'visible names' do
  scenario 'if a user is signed in, their name appears on their posts' do
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
    expect(page).to have_content "Posted by Barry"
  end
end
