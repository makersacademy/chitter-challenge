feature 'a user can sign up, log in and go to the peeps page from the home page' do

  scenario 'a user can go to a sign up page, a log in page or a page showing peeps' do
    visit ('/')
    expect(page).to have_button('Sign up')
    expect(page).to have_button('Log in')
    expect(page).to have_button('See peeps')
  end

end
