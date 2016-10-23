feature 'Posting a peep' do
  scenario ' As a user I want to post a peep to Chitter' do
    visit 'peeps/new'
    fill_in :message, with: 'Hello world!'
    click_button 'Peep'
    expect(current_path).to eq '/'
    expect(page).to have_content 'Hello world!'
  end

end
