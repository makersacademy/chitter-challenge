feature 'home page' do
  scenario 'a user visits the chitter website and sees a greeting' do
    visit '/'
    expect(page).to have_content('Welcome to Chitter')
  end

  scenario 'a user visits sees a form to sign up or log in' do
    visit '/'
    expect(page).to have_button('Sign In')
    expect(page).to have_button('Join')
  end

  scenario 'clicking the Sign In button directs the user to the relevant form' do
    visit '/'
    click_button('Sign In')
    expect(page).to have_content('Enter your credentials')
    expect(page).to have_field('handle')
    expect(page).to have_button('Submit')
  end

  scenario 'clicking the Join button directs the user to the relevant form' do
    visit '/'
    click_button('Join')
    expect(page).to have_content('Joining Chitter is mad easy')
    expect(page).to have_field('handle')
    expect(page).to have_button('Submit')
  end
end
