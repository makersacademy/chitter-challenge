feature "Signing in:" do
  context "When signing up:" do
    scenario "signing up should increase the user count by 1" do
      visit('/users/sign-up')
      click_button('sign-up')
      expect(User.count).to change_by(1)
    end

    scenario "signing up should take the user to their Peeps page" do
      visit('/users/sign-up')
      click_button('sign-up')
      expect(current_path).to eq('/main/peeps')
    end

    scenario "the user should be redirected to a password confirmation page if their passwords do not match" do
      visit('users/sign-up')
      fill_in('password_confirmation', with: 'wrong')
      expect(current_path).to eq('/confirmpassword')
    end

    scenario "the page should not duplicate usernames or emails" do
      2.times do
        visit('users/sign-up')
        click_button('sign-up')
      end
      expect(page).to have_content('Username djtango is already taken')
      expect(page).to have_content('Email address dj@tan.go is already taken')
    end
  end
end