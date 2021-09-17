feature "Adding a cheet" do
  scenario "User can post a cheet to the database" do
    connection = PG.connect(dbname: 'chitter_test')

    visit '/'
    fill_in('cheet', :with => "Today is gonna be a great day!")
    click_button "Submit"
    expect(page).to have_content "Today is gonna be a great day!"
  end
end