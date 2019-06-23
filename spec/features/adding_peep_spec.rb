# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Adding peeps' do
  scenario 'Able to enter peeps' do
    visit('/')
    click_button 'add_peep'
    expect(page).to have_content "Peep:"
  end
end

feature 'Adding peeps' do
  scenario 'entering peeps' do
    visit('/')
    click_button 'add_peep'
    fill_in 'peep', with: 'Peepy peep peep'
  end
end
