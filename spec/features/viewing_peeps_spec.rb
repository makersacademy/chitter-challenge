feature 'peeps are shown in reverse chronological order' do
  scenario 'I peep then you peep, then your peep then my peep <3' do
    visit '/'
    click_link 'Post peep!'
    expect(page.current_path).to eq '/peeping'
    fill_in 'peep', with: 'testing my peepee'
    click_button 'Peep!'
    expect(page.current_path).to eq '/'
    expect(page).to have_content 'testing my peepee'
    click_link 'Post peep!'
    expect(page.current_path).to eq '/peeping'
    fill_in 'peep', with: 'the second peep test'
    click_button 'Peep!'
    expect(page.current_path).to eq '/'
    expect(page).to have_content 'the second peep test'
    expect(page).to have_content "the second peep test"
  end
end
