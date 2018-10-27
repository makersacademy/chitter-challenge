feature "Viewing pees" do
  scenario "on homepage" do
    add_two_peeps
    visit '/'
    expect(page).to have_content "Luigi This is peep 2 10:46 - 27/10/2018\nMario This is peep 1 10:45 - 27/10/2018"
  end
end
