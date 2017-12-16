feature "Viewing peeps in reverse chronological order" do
  scenario "I can see the most recent peeps first" do
    Peep.create(message: "My first peep!", created_at: DateTime.now - 1.0/(24*60)) # one minute
    visit("/peeps/new")
    fill_in :message, with: "My second peep!"
    click_button("Post")
    expect(page.body.index("My second peep!") < page.body.index("My first peep!")).to eql(true)
  end
end
