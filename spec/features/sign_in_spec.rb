
RSpec.feature "User signs in" do

  let!(:user){ User.create(email: "test@test.com", username: "test_user",
                name: "Testy Man", password: "passw0rd")}

  scenario "after sign up" do
    sign_in 
    expect(page).to have_content "Welcome #{user.name.split(' ')[0]}"
  end

  scenario "with wrong password" do
    sign_in password: 'wrong'
    expect(page).not_to have_content "Welcome #{user.name.split(' ')[0]}"
    expect(page).to have_content "Sign in"
  end
end
