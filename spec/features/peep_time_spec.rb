feature 'shows the time of the peep' do
  scenario 'I peep, it shows you its time!' do
    visit '/'
    click_link 'Post peep!'
    expect(page.current_path).to eq '/peeping'
    fill_in 'peep', with: 'testing my peepee'
    click_button 'Peep!'
    expect(page.current_path).to eq '/'
    expect(page).to have_content 'This was peeped at:'
  end
end
