# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature "view" do

  scenario "see all of the peeps" do
    visit ('/')
    click_on 'View Peeps'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Howdy"
  end

  scenario "see the list of peeps in reverse chronological order" do
    Chitter.create(post: "Hello1", timestamp: "17:24 01/01/2022")
    Chitter.create(post: "Hello2", timestamp: "17:25 01/01/2022")
    Chitter.create(post: "Hello3", timestamp: "17:26 01/01/2022")

    messages = Chitter.all
    expect(messages[0].post).to eq "Hello3"
    expect(messages[1].post).to eq "Hello2"
    expect(messages[2].post).to eq "Hello1"
  end

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

  scenario "display the time at which the post was made" do
    Chitter.create(post: "Time", timestamp: "17:24 01/01/2022")
    timestamp = Chitter.all[0].timestamp
    visit "/peeps"
    expect(page).to have_content(timestamp)
  end
end
