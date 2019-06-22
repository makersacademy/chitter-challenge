feature "Viewing Posts" do
  scenario "User able to see all posts on Chitter" do
    Peep.create(peep: "Hi Chitter!")
    
    visit("/peeps")

    expect(page).to have_content "Hi Chitter!"
  end
end
