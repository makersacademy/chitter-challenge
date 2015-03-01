require_relative './helpers/sign_in.rb'

feature "Existing user can log into Chitter" do

  include SignIn

  before(:each) do
    User.create(:email => "mrTex@test.com",
                 :user_name => "SuperMan",
                 :name => "Jimbo Jones",
                 :password => 'TedTex',
                 :password_confirmation => 'TedTex')
  end


  scenario 'with correct credentials' do
    sign_in("SuperMan", 'TedTex')
    expect(page).to have_content('Welcome, mrTex@test.com')
  end

  scenario 'no sign in with the wrong password' do
    sign_in("SuperMan", "wrongOne")
    expect(page).not_to have_content('Welcome mrTex@test.com')
  end

   scenario 'no sign in with the wrong user name' do
    sign_in("batman", "wrongOne")
    expect(page).not_to have_content('Welcome mrTex@test.com')
  end



end

