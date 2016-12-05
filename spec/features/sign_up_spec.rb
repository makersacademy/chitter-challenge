
RSpec.feature "User Sign Up" do

  scenario "should be able to sign up" do
    sign_up
    expect(page).to have_content "Welcome Django"
  end

end
