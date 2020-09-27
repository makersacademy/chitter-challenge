feature "homepage" do

  
  scenario "I want to view peeps in reverse chronological order" do
   sign_in
   peep_twice
   expect("Apparently, somebody on this site thinks we should wear banana hats?!").to appear_before("Personally, i think we should all wear hats made of bananas.")
  end
  
  scenario "so that i can see when peeps are peeped, I want the formatted time displayed alongside the peep" do 
   Timecop.freeze(2020, 12, 25, 10, 5, 0)
   sign_in
   peep_once
   visit('/feed')
   expect(page).to have_content "25 Dec 2020 at 10:05am"
  end
 
 
  scenario "i try to view feed without an account, it should error" do
    visit"/feed"
    expect(page).to have_content "You must be logged in to view peeps"
  end
 
  scenario "I should not be able to create a peep more than 120 letters" do
    one_twenty_ps = "pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp"
    too_long_text = "pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppphowdydoodly"
    sign_in
    visit"/new_peep"
    fill_in"peep", with: too_long_text
    click_on"Peep It!"
    expect(page).not_to have_content "howdydoodly"
    expect(page).to have_content one_twenty_ps
  end
 
  scenario "it displays my name alongside my peep" do
    sign_in
    peep_once
    expect(first('div.silver-background')).to have_content "potatoman"
  end
 
  scenario "it should welcome me to the site when i login" do
    sign_in
    expect(page).to have_content "Welcome potatoman"
  end

  scenario "I should not be able to peep after loggin out" do
    sign_in
    click_on "logout"
    visit"/new_peep"
    expect(page).to have_content "You must be logged in to create peeps"
  end
 end
 
 