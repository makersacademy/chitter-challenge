require './app/models/user'

feature 'user sign out' do


before(:each) do
 @user = User.create(email: 'email@isp.com',
               password: '1234',
               password_confirmation: '1234')
             end

  scenario 'user can sign out' do
    sign_in(email: @user.email, password: @user.password)
    click_button 'Sign out'
    expect(page).to have_content "Goodbye"
    expect(page).not_to have_content("Welcome, email@isp.com")
  end



end
