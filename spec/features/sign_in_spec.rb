feature 'Sign In' do 
  scenario "User can sign into Chitter" do
    visit '/'
    fill_in(:username, with:"Peepz4Days")
    click_button 'Sign In'
    
    expect(page).to have_css('input[name="message"]')
    expect(page).to_not have_css('input[name="username"]')
  end


end
