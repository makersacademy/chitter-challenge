feature "Vewing peeps" do
  scenario "access website and see a peep" do
    Peep.create(username: 'KirillZ', date: '10/10/2018', content: "Hello World!")

    visit '/peeps'

    expect(page).to have_content("Hello World!")
  end
end
