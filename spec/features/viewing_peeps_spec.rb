feature "Viewing pees" do
  scenario "on homepage" do
    add_two_users_to_db
    add_two_peeps
    visit '/'
    expect(page).to have_content "Ash Ketchum @red\nThis is peep 2\n10:46 - 27/10/2018\nanonymous\nThis is peep 1\n10:45 - 27/10/2018"
  end
end
