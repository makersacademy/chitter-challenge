#As a Maker
#So that I can avoid others posting messages on Chitter as me
#I want to log out of Chitter

feature 'Sign out' do
  scenario 'Tries to peep but is redirected to signin' do
    signup
    click_button('Log out')
    click_button('Peep')
    expect(current_path).to eq('/user/signin')
  end
end
