require './app/app'

RSpec.feature "Signing up", :type => :feature do
  include Helpers
  before do
    @user_count = User.all.count
    user = User.new(username: 'Miko', email: 'miko@o2.pl', password: 'gweatonidas326', password_confirmation: 'gweatonidas326')
    sign_up(user)
  end

  scenario "user creates an account" do
    expect(current_path).to eq '/dashboard'
    message = "Welcome to Chitter, Miko!"
    expect(page).to have_content(message)
    expect(User.all.count).to eq (@user_count + 1)
  end

  scenario "username already exists" do
    visit '/users/new'
    fill_in('username', with: 'Miko')
    fill_in('email', with: 'miko2@o2.pl')
    fill_in('password', with: 'gweatonidas36')
    fill_in('password_confirmation', with: 'gweatonidas36')
    click_button('Submit')

    expect(current_path).to eq '/users/new'
    message = "Username is already taken"
    expect(page).to have_content(message)
    expect(User.all.count).to eq (@user_count + 1)
  end
end
