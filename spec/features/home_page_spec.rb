require './lib/users'

feature "landing page" do

  scenario "user sees list of test db first names" do
    User.delete_all
    User.create!(
      first_name: 'nicola', 
      last_name: 'carroll',
      email:'me@example.com'
    )
    visit("/")
    expect(page).to have_content "nicola"
  end

end