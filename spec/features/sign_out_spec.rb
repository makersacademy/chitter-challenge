feature "Sign out" do

  scenario 'I can sign out and no longer see my username' do

    visit('/')
    fill_in("username", with: "test")
    click_button 'Sign In'
    click_button 'Sign Out'
    expect(page).to have_content "Sign into Chitter!"
    expect(current_path).to eq ('/')

  end

end
