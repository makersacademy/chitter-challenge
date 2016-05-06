feature 'homepage displays greeting and two buttons' do


  scenario 'displays a welcome message' do
    visit '/'
    expect(page).to have_content "Welcome to Chitter"
  end

  scenario 'has a sign_up button' do
    visit '/'
    expect(page).to have_button "Sign up"
  end

  scenario 'has a sign in button' do
    visit '/'
    expect(page).to have_button "Sign in"
  end
end
