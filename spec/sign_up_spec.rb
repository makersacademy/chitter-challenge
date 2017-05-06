require 'web_helpers'

feature "User can sign up to Chitter" do
  scenario "A user signs up to Chitter" do
    visit '/'
    click_link 'Sign Up'
    fill_in :name, with: "Bertie"
    fill_in :email, with: "Test.email@test.com"
    fill_in :username, with: "BertZ"
    fill_in :password, with: "Password1234"
    fill_in :password_confirmation, with: "Password1234"
    click_button "Create Account"
    user = User.last
    expect(user.password_encrypt).to_not eq("Password1234")
    expect(user.name).to eq('Bertie')
    expect(user.username).to eq('BertZ')
    expect(page).to have_current_path("/home")
    expect(page).to have_content("Welcome to Chitter BertZ")
    expect(page).to have_link("Peep")
    expect(page).to have_link("Sign out")
    expect { sign_up }.to change { User.all.count }.by 1
  end
  scenario 'requires a matching password to sign_up' do
    expect { sign_up_wrong_password }.not_to change { User.all.count }
  end
end


# feature "A User cannot sign up with the same Username or Email" do
#   scenario "I cannot sign up with the same Username" do
#     expect { sign_up }.to_not change {User.all.count}
#     expect(page).to have_content('Username already taken')
#   end
#   scenario "I cannot sign up with the same Email" do
#     expect { sign_up }.to_not change {User.all.count}
#     expect(page).to have_content('Email already taken')
#   end
# end
