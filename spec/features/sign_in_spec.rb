feature "sign in" do
  scenario "when user sign in, can have acces to cheeter" do
    visit "/"
    fill_in :name, with: 'jenny'
    click_button "submit"
    expect(page).to have_content 'sign in'
  end
end
