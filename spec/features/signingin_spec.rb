feature "Signing in:" do
  context "When signing up:" do

    scenario "signing up should increase the user count by 1" do
      expect {
      visit('/users/sign-up')
      click_button('Sign up!')
        }.to change(User, :count).by(1)
    end

    scenario "signing up should take the user to their Peeps page" do
      visit('/users/sign-up')
      click_button('Sign up!')
      expect(current_path).to eq('/main/peeps')
    end

    scenario "a user should not be created if there is the passwords do not match" do
      expect{
      visit('users/sign-up')
      fill_in('password_confirmation', with: 'wrong')
        }.not_to change(User, :count)
    end

    scenario "the page should not duplicate usernames or emails" do
      expect{
        2.times do
          visit('/users/sign-up')
          click_button('Sign up!')
        end
      }.to change(User, :count).by(1)
      # expect(page).to have_content('Username djtango is already taken')
      # expect(page).to have_content('Email address dj@tan.go is already taken')
    end

  end
end