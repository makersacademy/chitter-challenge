feature 'User sign in' do

   let(:user) do
     User.create(name: 'user',
                 username: 'userperson',
                 email: 'user@example.com',
                 password: 'secret1234',
                 password_confirmation: 'secret1234')
     end

   scenario 'with correct credentials' do
     sign_in(email: user.email,   password: user.password)
     expect(page).to have_content "Welcome, #{user.email}"
   end

end

feature 'User signs out' do

  let(:user) do
    User.create(name: 'test',
                username: 'testtest',
                email: 'test@test.com',
                password: 'testing',
                password_confirmation: 'testing')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: 'test')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!') # where does this message go?
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
