# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order
feature "viewing all peeps" do
  scenario "view peeps in reverse chronological order" do
    
    # Add the test data
    Peep.create("Wow, that's so cool")
    Peep.create("The end is nigh")

    visit '/peeps'

    first_list_item = page.find('li', text: "The end is nigh", match: :prefer_exact )
    second_list_item = page.find('li', text: "Wow, that's so cool", match: :prefer_exact )

    expect(first_list_item).to appear_before(second_list_item)
  end
end