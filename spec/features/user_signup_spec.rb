feature 'user can sign up' do
  scenario 'user can enter their details and create an account' do
    expect { create_account('Tom Moir', 'tmerrr', 'tom@mail.me', 'MyPassword') }
      .to change { User.all.length }.by(1)
  end

  scenario 'user can see a welcome message after sign up' do
    create_account('Tom Moir', 'tmerrr', 'tom@mail.me', 'MyPassword')
    expect(page).to have_content('Welcome tmerrr!')
  end

  scenario 'user not added if they have mismatching passwords' do
    expect { complete_signup_with_wrong_passwords }
      .not_to change { User.all.length }
    expect(page).to have_content('Passwords did not match.')
  end

  scenario 'user not added if they have a blank password' do
    expect { complete_signup_with_no_password }
      .not_to change { User.all.length }
    expect(page).to have_content('Invalid username, email or password.')
  end

  scenario "can't use an existing username or email address" do
    create_account('Tom Moir', 'tmerrr', 'tom@mail.me', 'MyPassword')
    # Same username:

    expect { create_account('Tim Muir', 'tmerrr', 'tim@gmail.com', 'MyPassword') }
      .not_to change { User.all.length }
    expect(page).to have_content('Username already exists')

    # Same email:
    expect { create_account('Tom Moir', 'trmoir9', 'tom@mail.me', 'MyPassword') }
      .not_to change { User.all.length }
    expect(page).to have_content('There is already an account registered to that email address')
  end
end
