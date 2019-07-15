# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'viewing chitter' do
  scenario 'visiting the index page' do
    visit ('/')
    expect(page).to have_content "peep"
  end
end
