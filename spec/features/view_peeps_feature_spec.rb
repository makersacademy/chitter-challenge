require 'peep'

feature "view peeps" do
  scenario "User goes to main page and views peeps" do
    visit '/'
    expect(page).to have_content "I love dogs"
    expect(page).to have_content "I love cats"
  end

  scenario "User adds a peep" do
    visit '/'
    click_on "Add peep"
    fill_in("title", with: "Dolphins")
    fill_in("peep", with: "I love blooody dolphins. They are bloomin' marvellous")
    expect(page).to have_content "bloomin' marvellous"
  end

end
