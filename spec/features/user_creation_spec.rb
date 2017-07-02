feature 'User Sign up' do
  before do
    sign_up
  end

  scenario 'Can sign up for an account' do
    expect(User.count).to eq 1
    expect(page).to have_content "Signed in as tom"
  end

  scenario 'Sends user to peeps page after registration' do
    expect(page.current_path).to eq '/peeps'
  end
end

feature 'Incorrect Sign ups' do
  feature 'Bad Passwords' do
    scenario 'does not make account if password confirmation is wrong' do
      expect { sign_up(password: 'no type good') }.to_not change(User, :count)
      expect(page.current_path).to eq '/users/new'
    end

    scenario 'shows an error on non-matching passwords' do
      sign_up(password: 'very incorrect yes')
      expect(page).to have_content 'Password does not match the confirmation'
    end
  end

  feature 'Bad Emails' do
    scenario "can't sign up without entering an email address" do
      expect { sign_up(email: nil) }.to_not change(User, :count)
      expect(page.current_path).to eq '/users/new'
      expect(page).to have_content "Email must not be blank"
    end

    scenario "can't sign up twice with the same email" do
      sign_up
      expect { sign_up(email: "tom@test.com") }.to_not change(User, :count)
      expect(page.current_path).to eq '/users/new'
      expect(page).to have_content "Email is already taken"
    end
  end

  feature 'Bad Usernames' do
    scenario "can't sign up without a username" do
      expect { sign_up(username: nil) }.to_not change(User, :count)
      expect(page).to have_content "Username must not be blank"
    end

    scenario "can't sign up twice with the same username" do
      sign_up
      expect { sign_up(username: "tom", email: "tom2@test.com") }.to_not change(User, :count)
      expect(page).to have_content "Username is already taken"
    end
  end
end
