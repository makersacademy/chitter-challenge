feature "posting a peep" do
  scenario "A user can post a peep to the ChitterFeed" do 
    sign_up
    fill_in :peep, with: 'Hey, this is my first peep!'
    click_button "Post Peep"
    
    expect(page).to have_content 'Hey, this is my first peep!'
  end
end