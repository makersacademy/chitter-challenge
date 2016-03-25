feature 'Chitter Home Page' do
  scenario 'Index page is the peeps list' do
    visit '/'
    expect(page).to have_content "Welcome to Chitter!"
  end

  scenario 'Shows sign up and sign in buttons' do
    visit '/'
    within 'div#mainbar' do
      expect(page).to have_button("Sign Up")
      expect(page).to have_button("Sign In")
    end
  end

  scenario 'Welcomes a logged-in user' do
    sign_up_correctly
    expect(page).to have_content "Hi, Paul!"
  end
end
