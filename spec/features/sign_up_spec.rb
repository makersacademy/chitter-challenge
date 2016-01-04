# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Signing up' do

  scenario 'New users can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq('foobar@example.com')
  end
  context 'Information is inputed incorrectly: ' do
    scenario 'no matching confirmation password to not add to database' do
      expect { bad_confirmation_sign_up }.not_to change(User, :count)
      expect(current_path).to eq('/signup')
      expect(page).to have_content "Password does not match the confirmation"
    end
    scenario 'I cannot sign up without an email address' do
      expect { no_email_sign_up }.not_to change(User, :count)
      expect(current_path).to eq('/signup')
      expect(page).to have_content('Email must not be blank')
    end
    scenario "with invalid email address" do
      expect { invalid_email_sign_up }.not_to change(User, :count)
      expect(current_path).to eq('/signup')
      expect(page).to have_content('Email has an invalid format')
    end
    scenario 'I cannot sign up with an existing records' do
      sign_up
      expect { sign_up }.to_not change(User, :count)
      expect(page).to have_content('Email is already taken')
    end
  end

end
