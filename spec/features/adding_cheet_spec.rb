feature "Adding a peep" do
  scenario "User can post a peep to the database" do
    connection = PG.connect(dbname: 'chitter_test')

    visit '/'
    fill_in('peep', :with => "Today is gonna be a great day!")
    click_button "Submit"
    expect(page).to have_content "Today is gonna be a great day!"
  end
end
