feature 'Peeps' do
  scenario 'expect homepage to have display peeps when logged out' do
    visit('/')
    submit_peep
    click_button 'Log out'
    expect(page.current_path).to eq '/'
    expect(page).to have content 'My first test peep!'
  end
end
