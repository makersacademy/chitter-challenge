feature "Sign out" do

  scenario 'I can sign out and no longer see my username' do
    create_account
    sign_in
    click_button 'Sign Out'
    expect(page).to have_content "Sign into Chitter !"
    expect(current_path).to eq ('/home')

  end

end
