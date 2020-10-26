feature 'Sign In' do 
  scenario "User can sign into Chitter" do
    visit '/'
    fill_in(:username, with:"Peepz4Days")
    click_button 'Sign In'
    expect(page).to have_content "Welcome, Peepz4Days!"
  end


end
