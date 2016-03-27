  feature 'select sign-in or sign-up' do
    scenario 'I can choose whether to sign in or sign-up' do
      visit('/')
      click_button('Sign up')
      expect(current_path).to eq('/users/new')
    end
  end


feature 'User sign up' do
  scenario 'I can sign up as a new user' do

    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Simon')
    expect(User.first.email).to eq('test@test.com')
  end

  scenario "If I get my password wrong I won't be logged in" do
    expect { sign_up_not_matching_password }.not_to change(User, :count)
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up_no_email }.not_to change(User, :count)
  end

  scenario 'I cannot sign up with an invalid email address' do
    expect { sign_up_wrong_email_format }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end

feature 'User sign in' do

  let(:user) do
    User.create(username: 'Simon',
                email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(user.email,   user.password)
    expect(page).to have_content "#{user.username}"
  end
end

feature 'User sign out' do

  let(:user) do
    User.create(username: 'Simon',
                email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'click sign out' do
    sign_in(user.email,   user.password)
    click_button("Sign out")
    expect(page).to have_content('Over and Out!')
    expect(page).not_to have_content "#{user.username}"
  end
end
