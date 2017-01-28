require_relative "user_helpers"

feature "users can be created" do
  scenario "user fills out fields correctly" do
    sign_up

    expect(User.first.full_name).to eq "Donald J. Trump"
    expect(User.first.user_name).to eq "realDonaldTrump"
    expect(User.first.email).to     eq "scumlord@potus.com"

    expect(current_path).to eq "/"
    expect(page).to have_content "@realDonaldTrump"
  end


  context "user has not filled out form successfully" do
    scenario "bad password_confirmation" do
      sign_up(password_confirmation: "not correct")
      expect(User.first).to be_nil
      expect(current_path).to eq "/user"
      expect(page).to have_content "Password does not match the confirmation"
    end
    scenario "bad email" do
      sign_up(email: "not correct")
      expect(User.first).to be_nil
      expect(current_path).to eq "/user"
      expect(page).to have_content "Email has an invalid format"
    end
    scenario "empty fields" do
      sign_up(full_name: "")
      expect(page).to have_content "Full name must not be blank"

    end
    xscenario "dupiclated email" do #needs logout to test
      sign_up
      sign_up(user_name: "bob")
      expect(User.first).to be_nil
      expect(current_path).to eq "/user"
      expect(page).to have_content "Email has an invalid format"
    end
  end
end
