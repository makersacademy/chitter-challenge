require 'pg'

feature 'Show message' do
  scenario 'Show existing messages' do
    Chitter.create({name: "Dog person", peep: "Woof."})
    visit('/')
    expect(page).to have_content "Dog person", "Woof."
  end
end

feature 'Peeping functionality' do
  scenario "Fill in boxes to peep" do
    visit('/')
    fill_in('name', with: "Bob")
    fill_in('peep', with: "I can build things.")
    click_button "Peep!"
    expect(page).to have_content "Bob", "I can build things."
  end

end
