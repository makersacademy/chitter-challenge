feature 'allows a user to post a peep' do
  scenario 'post a peep' do
    visit('/')
    fill_in 'Whats on your mind?', with: 'first peep!'
    click_button("Post")
    expect(page).to have_content 'first peep!'
  end

  # scenario 'seeing the time a next to a peep' do
  #   visit('/')
  #   fill_in 'Whats on your mind?', with: 'first peep!'
  #   click_button("Post")
  #   expect(page).to have_content Time.now
  # end
end

feature 'allows a user to sign up for chitter' do

  scenario 'homepage has link to sign-up page' do
    visit('/')
    expect(page).to have_selector(:css, 'a[href="/sign-up"]')
  end

  scenario 'sign in to chitter' do
    visit('/sign-up')
    fill_in 'name', with: 'Richie'
    fill_in 'username', with: 'richieganney'
    fill_in 'email', with: 'richieganney@icloud.com'
    fill_in 'password', with: 'Password123'
    click_button("Sign up!")
    expect(page).to have_content "Chitter"
  end
end
