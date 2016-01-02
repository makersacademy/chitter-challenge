# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Client sign up' do
  scenario 'I can sign up as a new user with valid password' do
    expect { sign_up }.to change { User.count }.by(1)
    expect(User.first.email).to eq('test@email.com')
  end
  context "I can't sign up" do
    context 'without' do
      scenario "username" do
        expect { sign_up(username: nil) }.not_to change { User.count }
        expect(current_path).to eq '/users'
        expect(page).to have_content('Username must not be blank')
      end

      scenario "name" do
        expect { sign_up(name: nil) }.not_to change { User.count }
        expect(current_path).to eq '/users'
        expect(page).to have_content('Name must not be blank')
      end

      scenario "email address" do
        expect { sign_up(email: nil) }.not_to change { User.count }
        expect(current_path).to eq '/users'
        expect(page).to have_content('Email must not be blank')
      end
    end

    context 'with wrong' do
      scenario "password confirmation" do
        visit('/users/new')
        expect(page.status_code).to eq(200)

        expect { sign_up(password_confirmation: 'wrong') }.not_to change { User.count }
        expect(page).to have_content('Password does not match the confirmation')
      end

      scenario "email address format" do
        expect { sign_up(email: 'test@email') }.not_to change { User.count }
        expect(current_path).to eq '/users'
        expect(page).to have_content('Email has an invalid format')
      end
    end

    scenario "using an email already taken" do
      sign_up
      expect { sign_up }.not_to change { User.count }
      expect(current_path).to eq '/users'
      expect(page).to have_content('Email is already taken')
    end

    scenario "using an username already taken" do
      sign_up
      expect { sign_up }.not_to change { User.count }
      expect(current_path).to eq '/users'
      expect(page).to have_content('Username is already taken')
    end
  end
end
