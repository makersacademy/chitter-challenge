feature 'Sign in' do
  scenario 'has a sign in form' do
    visit('/')
    expect(page).to have_content "Enter your user-name"
    expect(page).to have_button "Sign-in"
  end
  scenario 'takes user to peeps page on sign-in' do
    visit('/')
    fill_in('user_name', with: 'Jack123')
    click_button('Sign-in')
    expect(page).to have_content 'Peep!'
  end

  xscenario 'peeps page displays the user-name of who is signed in' do
    visit('/')
    fill_in('user_name', with: 'Jack123')
    click_button('Sign-in')
    expect(page).to have_content 'Welcome, Jack123'
  end
end