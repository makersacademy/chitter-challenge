def createpeep
  visit "/"
  fill_in :peep, with: "Hello, world"
  click_button "Submit"
end

def createsecondpeep
  visit "/"
  fill_in :peep, with: "Hello again, world"
  click_button "Submit"
end
