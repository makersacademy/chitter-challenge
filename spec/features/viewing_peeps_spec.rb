feature "Viewing peeps" do

  scenario "Visting the index page" do
    visit('/')
    expect(page).to have_content 'Welcome to the peep show'
  end

  scenario "View the peeps in a list" do
    visit('/peeps')

    expect(page).to have_content "This is a peep"
    expect(page).to have_content "This is another peep"
    expect(page).to have_content "Third peep here"
  end
end
