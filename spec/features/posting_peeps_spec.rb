feature 'Post a peep' do
  scenario 'Maker visits Chitter' do
    visit '/'
    expect(page).to have_content('Welcome to Twi... CHITTER!')
  end
end
