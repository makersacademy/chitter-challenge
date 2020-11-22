feature 'post a peep' do 
  scenario 'loggin a user name and be welcomed with my name' do
    visit('/')
    fill_in :username, with: 'Rafa'
    click_button 'Log in!'
    expect(page).to have_content "Welcome Rafa"
  end
end