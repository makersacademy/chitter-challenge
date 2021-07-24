feature 'post message' do
  scenario 'can post a message to chitter' do
    visit('/peeps/new')
    fill_in('peep', with: 'Here is a test peep')
    click_button('Submit')

    expect(current_path).to eq('/peeps')
    expect(page).to have_content('Here is a test peep')
  end
end
