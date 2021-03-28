require 'spec_helper'
require 'pg'

feature 'view peeps' do
  scenario 'view peeps' do 
    Peep.post(content: "Test Peep", name:"Tester")
    visit '/peeps'
    expect(page).to have_content("Test Peep")
    expect(page).to have_content("Tester")
    # this test isn't really testing that the posts are in reverse chronological order, that is covered in unit test for .all method not sure how to cover it here
  end 

  # a bit confused about testing time, do either of these tests work or neither?
  # had to comment out the first test as it began throwing a huge error.
  
  # scenario 'displays the time the peeps were posted' do
  #   Peep.post(content: "Test Peep", name:"Tester")
  #   visit '/peeps'
  #   expect(page).to have_content Time.now.to_s[0..18]
  # end 

  scenario 'displays the time the peeps were posted' do
    DatabaseConnection.query("INSERT INTO peeps (content, posted_at) VALUES('Test Peep', ' 2021-03-03 15:15:15');")
    # here I override the automatic timestamp in my table
    visit '/peeps'
    expect(page).to have_content("Test Peep")
    expect(page).to have_content("15:15:15")
  end 

end 
