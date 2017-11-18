feature 'Post a peep' do
  scenario 'Maker visits Chitter' do
    visit '/'
    expect(page).to have_content('Welcome to Twi... CHITTER!')
  end
  scenario 'Maker wants to post a peep' do
    visit '/'
    fill_in('Subject', with: "Hello World!")
    fill_in('Peep-Peep', with: "So this is my first peep on Chitter!")
    click_button('Peep away!')
    puts page
    expect(page).to have_content('You just Peeped yourself!')
  end
end
