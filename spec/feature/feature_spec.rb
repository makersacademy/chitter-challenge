#Feature tests for the web app

feature 'Peeps page:' do
  scenario '- index shows all peeps' do
    visit('/')
    expect(page).to have_content "Post from 2019-12-02 @ 10:00"
    expect(page).to have_content "Post from 2019-11-17 @ 10:00"
    expect(page).to have_content "Post from 2019-08-16 @ 10:00"
    expect(page).to have_content "Post from 2019-12-02 @ 08:00"
  end

  scenario "- 'Enter a peep' adds a new peep" do
    visit('/')
    fill_in "post", with: "Testing 1, 2, 3"
    click_button "Submit"
    expect(page).to have_content "Testing 1, 2, 3"
  end
  
end
