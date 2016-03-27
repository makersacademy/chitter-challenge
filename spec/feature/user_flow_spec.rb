feature 'User sign up' do
  scenario 'I can sign up as a new user' do

    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Simon')
    expect(User.first.email).to eq('test@test.com')
  end

  scenario "If I get my password wrong I won't be logged in" do
    expect { sign_up_not_matching_password }.not_to change(User, :count)
    expect(page).to have_content('Passwords do not match')
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up_no_email }.not_to change(User, :count)
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end
