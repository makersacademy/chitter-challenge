feature 'Sign-up page' do
  scenario 'A user can sign up' do
    visit('/')
    expect(page). to have_button "Sign up"
    expect(page). to have_button "Log in"
  end
end
