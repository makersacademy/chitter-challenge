def createpeep
  visit "/"
  fill_in :peep, with: "Hello, world"
  click_button "Submit"
end
