
feature 'Viewing index page' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
    expect(page).to have_content "Register an account here"
    expect(page).to have_content "Log into your account here"
  end

  scenario 'the register button redirects to the register page' do
    visit('/')
    click_button('Register')
    expect(page).to have_content("Register")
  end

  scenario 'the register button redirects to the login page' do
    visit('/')
    click_button('Log in')
    expect(page).to have_content("Log in")
  end


end