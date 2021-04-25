feature 'Viewing peeps in reverse chronological order' do
  scenario "A user can see peeps in reverse order" do
    Chitter.create(message: "Test Peep")
    Chitter.create(message: "Peep Testing!")
    visit('/reverse')
    expect(page).to have_content "Peep Testing!"
    expect(page).to have_content "Test Peep"
  end
end
