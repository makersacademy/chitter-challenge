require 'web_helpers'

feature "User can sign up to Chitter" do
  scenario "A user signs up to Chitter" do
    visit '/'
    expect { sign_up }.to change { User.all.count }.by 1
    user = User.last
    expect(user.password_encrypt).to_not eq("Password1234")
    expect(user.name).to eq('Bertie')
    expect(user.username).to eq('BertZ')
    expect(page).to have_current_path("/home")
    expect(page).to have_content("Welcome to Chitter BertZ")
    expect(page).to have_button("Peep")
    expect(page).to have_button("Sign Out")
  end
  scenario 'requires a matching password to sign_up' do
    expect { sign_up_wrong_password }.not_to change { User.all.count }
    expect(page).to have_content('Password does not match the confirmation')
  end
  scenario "Can't sign up with an invalid email adress" do
    expect { sign_up_wrong_email }.not_to change { User.all.count }
  end
end

feature "A User cannot sign up with the same Username or Email" do
  scenario "I cannot sign up with the same Username" do
    sign_up
    expect { sign_up }.to_not change { User.all.count }
    expect(page).to have_content('Username is already taken')
  end
  scenario "I cannot sign up with the same Email" do
    sign_up
    expect { sign_up }.to_not change { User.all.count }
    expect(page).to have_content('Email is already taken')
  end
end
