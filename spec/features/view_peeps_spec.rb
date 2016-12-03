feature "View Peeps" do

  scenario "I want to view all peeps" do
    visit '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content "Peeps:"
  end

  scenario "I want to view the name and username of the maker" do
    sign_up
    sign_in
    add_peep
    expect(page).to have_content "Tester"
    expect(page).to have_content "tester1"
  end
end
