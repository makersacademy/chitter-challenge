feature 'Viewing peeps' do
  scenario "A user can see peeps" do
    Chitter.create(message: "Test Peep")
    Chitter.create(message: "Peep Testing!")
    visit('/view')
    expect(page).to have_content "Test Peep"
    expect(page).to have_content "Peep Testing!"
  end
end
