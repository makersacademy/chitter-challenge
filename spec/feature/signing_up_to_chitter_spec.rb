feature 'people can sign up for Chitter' do
  scenario 'when signing up from the homepage' do
    sign_up_for_chitter
    expect(page).to have_content('Welcome to Chitter, Bob Loblaw!')
  end
  scenario 'and are signed in after signing up' do
    visit('/')
    sign_up_for_chitter
    expect(page).to have_content('You are currently logged in as bloblaw')
  end
  scenario 'with a unique email only' do
    User.create(email: 'bobloblaw@lawblog.com', password: 'bobloblawslawblog', name: 'Bob Loblaw', username: 'bloblaw')
    visit('/')
    click_link('sign up for Chitter')
    fill_in 'email', with: 'bobloblaw@lawblog.com'
    fill_in 'password', with: 'jeanparmigian'
    fill_in 'name', with: 'Jean Parmigian'
    fill_in 'username', with: 'jeeaaaaaan'
    click_button('Submit')
    expect(page).to have_content("That email or username are already taken, please try again")
    expect(page).not_to have_content("You are currently logged in as jeaaaaaan")
  end
  scenario 'with a unique username only' do
    User.create(email: 'bobloblaw@lawblog.com', password: 'bobloblawslawblog', name: 'Bob Loblaw', username: 'bloblaw')
    visit('/')
    click_link('sign up for Chitter')
    fill_in 'email', with: 'masterofdisguise@sneaky.com'
    fill_in 'password', with: 'jeanparmigian'
    fill_in 'name', with: 'Jean Parmigian'
    fill_in 'username', with: 'bloblaw'
    click_button('Submit')
    expect(page).to have_content("That email or username are already taken, please try again")
    expect(page).not_to have_content("You are currently logged in as bloblaw")
  end
end
