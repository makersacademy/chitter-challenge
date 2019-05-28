feature "Viewing peeps" do
  scenario "peeps are visible" do
    Peep.create(peep: "Eating sushi with Sal")
    Peep.create(peep: "Eating Sal as sushi")

    visit '/home'

    expect(page).to have_content("Eating sushi with Sal")
    expect(page).to have_content("Eating Sal as sushi")
  end
end
