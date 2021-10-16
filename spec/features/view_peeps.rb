feature 'Viewing peeps' do
  scenario 'view peeps' do
    Peep.add(contents: "I'm having a nice day")
    Peep.add(contents: "I like football")
    visit('/')
    expect(page).to have_content("I'm having a nice day")
  end
end