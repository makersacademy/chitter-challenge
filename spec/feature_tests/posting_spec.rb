require 'orderly'
require 'timecop'
feature "post" do
  scenario "so i can argue online, I want to be able to peep" do
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

feature "homepage" do

  
 scenario "I want to view peeps in reverse chronological order" do
  peep_twice
  expect("Apparently, somebody on this site thinks we should wear banana hats?!").to appear_before("Personally, i think we should all wear hats made of bananas.")
 end
 
 scenario "so that i can see when peeps are peeped, I want the formatted time displayed alongside the peep" do 
  Timecop.freeze(2020, 12, 25, 10, 5, 0)
  peep_once
  visit('/feed')
  expect(page).to have_content "25 Dec 2020 at 10:05am"
 end


 scenario "i try to view feed without an account, it should error" do
 end

 scenario "I should not be able to create a peep more than 120 letters" do
 end

 scenario "it displays my name alongside my peep" do
 end

 scenario "it should welcome me to the site when i login" do

 end
end

feature "account security" do

  scenario "it should not let me login with out a registered username" do
  end

  scenario "should not let me log into a username if my password is incorrect" do
  end

  scenario "when i logout i want to return to the login/signup page" do

  end
  
  scenario "when i've logged out, i can't access the feed" do
end