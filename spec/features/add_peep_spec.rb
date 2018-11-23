feature "User can add a peep and see it in the list" do
  scenario "User enters content of peep in form" do

    connection = PG.connect(dbname: 'chitter_test')

    visit ('/peeps/peeps_list')

    fill_in 'content', with: "Wagwan y'all"

    click_button 'Submit'

    expect(page).to have_content("Wagwan y'all")

  end
end
