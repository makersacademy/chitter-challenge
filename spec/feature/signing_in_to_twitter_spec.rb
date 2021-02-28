feature 'signing in to chitter' do
  scenario 'keeps user logged in to chitter and allows them to post peeps' do
    user = User.create(email: 'bobloblaw@lawblog.com', password: 'bobloblawslawblog', name: 'Bob Loblaw', username: 'bloblaw')
    visit('/')
    click_link('Log in')
    fill_in 'username', with: 'bloblaw'
    fill_in 'password', with: 'bobloblawslawblog'
    click_button('Submit')
    expect(page).to have_content('You are currently logged in as bloblaw')
  end
  scenario 'gives an error message if user details do not match records' do
    user = User.create(email: 'bobloblaw@lawblog.com', password: 'bobloblawslawblog', name: 'Bob Loblaw', username: 'bloblaw')
    visit('/')
    click_link('Log in')
    fill_in 'username', with: 'bloblaw@lawblog.com'
    fill_in 'password', with: 'blobloblawslawblog'
    click_button('Submit')
    expect(page).to have_content("I'm sorry, those details don't match our records")
  end
end
