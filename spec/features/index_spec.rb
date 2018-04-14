require 'pg'

feature 'Show message' do
  scenario 'Show existing messages' do
    Chitter.create({name: "Dog person", peep: "Woof."})
    visit('/')
    expect(page).to include("Dog person", "Woof.")
  end
end

feature 'Enter message and have it show' do


end
