require 'orderly'

feature "viewing peeps" do

  scenario "User can see peeps" do
    visit("/")
    expect("Goodbye!").to appear_before("Hello world!")
    expect(page).to have_content(Time.now.strftime("%Y-%m-%d %H:%M:%S"))
  end

end
