feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, John")
    expect(User.first.email).to eq("john@example.com")
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Passwords do not match'
  end

  scenario "I can't sign up without an email address" do
     expect { sign_up(email: nil) }.not_to change(User, :count)
   end

   scenario "I can't sign up without a name inputted" do
     expect { sign_up(name: nil) }.not_to change(User, :count)
   end

   scenario "I can't sign up without an username" do
     expect { sign_up(username: nil) }.not_to change(User, :count)
   end

  def sign_up(name: 'John',
              username:'j.smith',
              email: 'john@example.com',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/users/new'
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
end

feature 'User sign in' do
   let(:user) do
     User.create(name: 'John',
                 username:'j.smith',
                 email: 'john@example.com',
                 password: '12345678',
                 password_confirmation: '12345678')
   end

   scenario 'signs in with correct credentials' do
     sign_in(email: user.email,   password: user.password)
     expect(page).to have_content "Welcome, #{user.name}"
   end

   def sign_in(email:, password:)
     visit '/sessions/new'
     fill_in :email, with: email
     fill_in :password, with: password
     click_button 'Sign in'
   end

 end
 feature 'Logins' do


   feature 'User signs out' do
     scenario 'can sign out if currently signed in' do
       sign_up
       sign_in(email: 'john@example.com', password: '123456')
       click_button 'Sign out'
       expect(page).to have_content('You have logged out.')
       expect(page).not_to have_content('Welcome, John')
     end
   end
 end
