feature 'Sign out' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test',
               name: 'test',
               username: 'test')
  end
  scenario 'allows a user to sign out while signed in' do
    sign_in(email: 'test@test.com', password: 'test')
    #require 'pry'
    #binding.pry
    expect(current_path).to eq('/bottle/new')
    click_button 'Leave the fold'
    expect(page).to have_content('Come back whenever you like')
    expect(page).not_to have_content('test@test.com')
  end
end
