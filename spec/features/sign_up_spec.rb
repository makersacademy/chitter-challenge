feature "Sign up" do

  scenario "I see a sign up form with a username field" do
    visit('/sign_up')
    expect(page).to have_field("Username")
  end

  scenario "I see a sign up form with a email field" do
    visit('/sign_up')
    expect(page).to have_field("email")
  end
  
end
