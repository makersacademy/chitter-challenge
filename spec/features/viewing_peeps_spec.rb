feature "Viewing pees" do
  scenario "on homepage" do
    add_two_users_to_db
    add_two_peeps
    visit '/'
    expect(page).to have_content "Ash Ketchum @red This is peep 2 10:46 - 27/10/2018\nanonymous This is peep 1 10:45 - 27/10/2018"
  end
end
