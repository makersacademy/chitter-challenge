feature 'Post a chit' do
  scenario 'I want to make a new chit and post it' do
    text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    
    visit '/chits/new'
    fill_in :message, with: text
    click_button 'Chit'

    expect(current_path).to eq '/chits'

    expect(page).to have_content text
  end
end
