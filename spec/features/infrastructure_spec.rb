require './spec/web_helper.rb'

feature "page load" do
  db_connection = connect
  scenario "on navigation to localhost url we land on the root page" do
    visit("/")
    expect(page).to have_title("Chitter")
  end
end
