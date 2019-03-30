# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Compose a peep' do
  scenario 'I want to be prompted to compose a peep' do
    visit '/message/new'
    expect(page).to have_content 'Compose a new peep'
  end
end

feature 'Post a peep' do
  scenario 'Form where I can submit peep and adds to peepdeck' do
    visit '/message/new'
    fill_in('peep', with: 'My second peep!')
    click_button('Submit')

    expect(page).to have_content 'My second peep!'
  end
end
