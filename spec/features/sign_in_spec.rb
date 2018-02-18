feature "sign in" do
  scenario "when user sign in, can have acces to cheeter" do
    visit "/"
    expect(page).to have_content 'sign in'
  end
end
