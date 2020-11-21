feature 'can peep' do
  scenario 'you go to the home page, write a tweet, and post it' do
    visit '/'
    fill_in 'peep', with: 'testing my peepee'
    click_button 'Peep!'
    expect(page).to has_xpath? '/'
    expect(page).to have_content 'testing my peepee'
  end
end
