feature 'create a peep on Chitter' do
  scenario 'user is able to create a peep' do
    visit ('/')
    fill_in 'peep',with:"What's on your mind?"
    expect(page).to have_field "What's on your mind?"
    expect(page).to have_button 'Post Peep'
  end

  scenario 'user is able to post peep' do
    visit ('/')
    fill_in 'peep', with: 'Hello World'
    click_button 'Post Peep'
    expect(page).to have_content 'Hello World'
  end
end


