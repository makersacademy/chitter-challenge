feature 'log out' do

  scenario 'logged in user successfully logs out' do
    sign_up
    click_button("Log out")
    expect(current_path).to eq '/feed'
    expect(page).to_not have_content("Welcome @SuperRafi")
  end

end
