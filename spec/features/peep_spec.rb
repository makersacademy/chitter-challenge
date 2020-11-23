feature 'can peep' do
  scenario 'you go to the home page, write a tweet, and post it' do
    visit '/'
    click_link 'Post peep!'
    expect(page.current_path).to eq '/peeping'
    fill_in 'peep', with: 'testing my peepee'
    click_button 'Peep!'
    expect(page.current_path).to eq '/'
    expect(page).to have_content 'testing my peepee'
  end
end
