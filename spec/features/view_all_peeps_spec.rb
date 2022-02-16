# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order
feature "viewing all peeps" do
  scenario "view peeps in reverse chronological order" do
    
    # Add the test data
    Peep.create("This is a peep")
    Peep.create("Wow, that's so cool")
    Peep.create("The end is nigh")

    visit '/peeps'


  end
end