feature 'new user signup' do
  scenario "signing up takes you back to the peep wall" do
    visit('/users/new')
    fill_in 'email', with: "peeper@chitter.com"
    fill_in 'password', with: "password123"
    fill_in 'name', with: "Chit Peeper"
    fill_in 'username', with: "ChitPeep4eva"
    click_button 'Join'
    expect(page).to have_content "Welcome, Chit Peeper"
  end

  scenario "once signed up, a peep shows your username" do
    visit('/users/new')
    fill_in 'email', with: "peeper@chitter.com"
    fill_in 'password', with: "password123"
    fill_in 'name', with: "Chit Peeper"
    fill_in 'username', with: "ChitPeep4eva"
    click_button 'Join'
    fill_in 'peep', with: "I love peeping! but now I'm hungry.."
    click_button 'Wall it!'
    expect(page).to have_content "ChitPeep4eva"
  end
end
