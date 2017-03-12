# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature "post" do
  scenario "user can post a message to chitter" do
    visit '/peep'
    expect(page.status_code).to eq 200
  end
end
