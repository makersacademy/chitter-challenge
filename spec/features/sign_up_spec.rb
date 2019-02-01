feature 'sign up' do
  scenario "user hasn't signed up or logged in" do
    visit("/peeps")
    expect(page).not_to have_content("Make a peep!")
    expect(page).to have_content("Sign up!")
  end
  scenario 'user signs up' do
    sign_up
    expect(page).to have_content("Make a peep!")
    expect(page).not_to have_content("Sign up")
  end
end
