feature 'Posting Peeps' do

  scenario 'I can post a peep and view it' do
    visit('/peeps/new')
    fill_in(:message, with: 'This is a peep')
    click_button('Post')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content('This is a peep')
  end

end
