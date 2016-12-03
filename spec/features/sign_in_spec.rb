
RSpec.feature "User sign in" do

  scenario "signing in" do
    sign_up
    sign_in
    expect(page).to have_content "Welcome Django"
  end

end
