feature 'user logs out' do

  scenario 'user logs themselves out' do
    register
    click_button "Logout"
    expect(page.title).to eq "Login"
  end

  scenario 'User logs out and tries to visit peeps' do
    register
    click_button "Logout"
    visit '/peeps'
    expect(page.title).to eq "Login"
  end

end
