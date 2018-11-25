feature "Viewing peeps" do

  scenario "Visting the index page" do
    visit('/')
    expect(page).to have_content 'Welcome to the peep show'
  end

  scenario "View the peeps in a list" do
    Peep.create(username: 'AsadK', date: '02/02/2018', content: "Hello sir!")

    visit '/peeps'

    expect(page).to have_content("Hello sir!")
  end
end
