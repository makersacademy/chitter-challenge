feature 'So that I can let people know what I am doing' do
  scenario 'I want to post a message (peep) to chitter' do
    visit('/peeps/new')
    fill_in('peep', with: 'My first peep')
    click_button 'Submit'
    expect(page).to have_content 'My first peep'
  end
end
