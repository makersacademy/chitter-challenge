feature 'Log out' do

  scenario 'I see an error for invalid credentials' do
    sign_up(username: "a username", password: "correct password")

    visit('/log_out')

    expect(page).to have_content "Welcome to Chitter!"
    expect(page).to have_link("Sign Up", href: '/sign_up')
    expect(page).to have_link("Log In", href: '/log_in')
  end

end
