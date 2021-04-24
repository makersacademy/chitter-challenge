feature 'Viewing chitter' do
  scenario 'visiting the homepage' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
    expect(page).to have_selector(:link_or_button, 'Send a peep')
  end

  scenario 'sending a peep' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
    click_button 'Send a peep'
    expect(current_path).to eq '/peep'
    fill_in('enter_peep', with: 'Hello, Chitter world!')
    click_button 'peep'
    expect(current_path).to eq '/home'
    expect(page).to have_content 'Hello, Chitter world!'
  end
end