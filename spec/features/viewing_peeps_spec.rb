require 'orderly'

feature "viewing peeps" do

  scenario "User can see peeps" do
    visit("/")
    expect("Goodbye!").to appear_before("Hello world!")
  end

end
