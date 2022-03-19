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
    Chitter.create(post: "Hello1")
    Chitter.create(post: "Hello2")
    Chitter.create(post: "Hello3")

    messages = Chitter.all
    expect(messages[0].post).to eq "Hello3"
    expect(messages[1].post).to eq "Hello2"
    expect(messages[2].post).to eq "Hello1"
  end

end
