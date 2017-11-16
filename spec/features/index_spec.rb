
feature "sign in" do
  scenario "when opening page enter info" do
    visit '/users/new'
    fill_in('Email', :with => 'joecowton@hotmail.com')
    fill_in('Password', :with => 'password')
    fill_in('Confirm_Password', :with => 'password')
    click_button('Submit')
    expect(page).to have_content "Welcome joecowton@hotmail.com"
  end
end
