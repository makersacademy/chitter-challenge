feature "seeing peeps on homepage" do
  scenario "user can see some peeps in chronological order" do
    visit('/')
    expect("@durov: Telegram v5.0 is out now! (2020-08-10 11:54:55)").to appear_before("@trump: BUILD THE WALL! (2020-10-10 12:35:50)")
  end
end

# expect("First name: Andrea").to appear_before("Last name: Robbinovich", only_text: true)