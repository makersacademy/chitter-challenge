# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'signing up to chitter' do

   scenario 'I can sign up' do
     expect { sign_up }.to change(User, :count).by(1)
     expect(page).to have_content('Welcome, Piet Jansen')
     expect(User.first.name).to eq('Piet Jansen')
   end

   scenario 'new user needs to confirm password' do
     expect { sign_up(password_confirmation: '123456') }.to_not change(User, :count)
   end

  #  scenario 'The email address is unique' do
  #    sign_up
  #    expect { sign_up }.to_not change(User, :count)
  #  end

  #  scenario 'The username is unique' do
  #    sign_up
  #    expect { sign_up }.to_not change(User, :count)
  #  end
end

# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

# feature 'logging in to chitter' do
#   scenario "I can login" do
#     create_user
#     login
#     expect(page).to have_content('Welcome, Piet Jansen')
#   end
# end
