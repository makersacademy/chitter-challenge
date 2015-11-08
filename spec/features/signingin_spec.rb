feature "Signing in:" do
  context "When signing up:" do

    scenario "signing up should increase the user count by 1" do
      expect {test_sign_up}.to change(User, :count).by(1)
    end

    scenario "signing up should take the user to their Peeps page" do
      test_sign_up
      expect(current_path).to eq('/main/peeps')
    end

    scenario "a user should not be created if there is the passwords do not match" do
      expect{
      visit('users/sign-up')
      fill_in('password_confirmation', with: 'wrong')
        }.not_to change(User, :count)
    end

    scenario "the page should not duplicate usernames or emails" do
      expect{ 2.times {test_sign_up} }.to change(User, :count).by(1)
    end

  end
end