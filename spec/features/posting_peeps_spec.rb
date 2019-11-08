# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature '2. Posting Peeps' do
  scenario '2.1 Posting a peep' do
    visit 'peeps/new'
    fill_in('peep', with: 'This is a new peep')
    click_button('Submit')
    expect(page).to have_content 'This is a new peep'
  end
end
