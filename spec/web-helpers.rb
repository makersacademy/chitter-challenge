
def sign_in 
  visit"/signup"
  fill_in "username", with: "potatoman"
  fill_in"password", with: "potato"
  click_on "register"
  fill_in "username", with: "potatoman"
  fill_in"password", with: "potato"
  click_on "login"
end

def peep_twice
  visit"/new_peep"
  fill_in "peep", with: "Personally, i think we should all wear hats made of bananas."
  click_on "submit"
  click_on "New Peep"
  fill_in "peep", with: "Apparently, somebody on this site thinks we should wear banana hats?!"
  click_on "Peep It!"
end

def peep_once
  visit"/new_peep"
  fill_in "peep", with: "Personally, i think we should all wear hats made of bananas."
  click_on "submit"
end

def register
  visit"/signup"
  fill_in "username", with: "potatoman"
  fill_in"password", with: "potato"
  click_on "register"
end