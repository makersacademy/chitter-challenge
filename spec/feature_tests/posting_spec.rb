require 'orderly'
require 'timecop'
feature "post" do
  scenario "so i can argue online, I want to be able to peep" do
    sign_in
    peep_once
    expect(page).to have_content "Personally, i think we should all wear hats made of bananas."
  end
=begin
  scenario "so that I know people can see me posting I want my peep to show on the homepage" do
    visit"/new_peep"
    fill_in "peep", with: "Personally, i think we should all wear hats made of bananas."
    click_on "Peep It!"
    click_on "Back to feed"
    expect(page).to have_content "Personally, i think we should all wear hats made of bananas."
  end
=end
end

