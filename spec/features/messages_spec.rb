feature 'Posting message to Chitter' do
  scenario 'posting a peep' do
    visit '/'
    expect(page).to have_field('message')
    expect(page).to have_selector(:link_or_button, "Peep")

    fill_in 'message', with: 'This is my first peep'
    click_button 'Peep'
    expect(page).to have_content 'This is my first peep'
  end

  scenario 'view posts in reverse chronological order' do
    visit '/'
    fill_in 'message', with: 'This is my first peep'
    click_button 'Peep'
    fill_in 'message', with: 'This is my second peep'
    click_button 'Peep'
    expect(page.first('div.peep-post').text).to eq 'This is my second peep'
  end
end
