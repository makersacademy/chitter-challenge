feature 'Peeps' do

  scenario 'expect profile page to display all peeps' do
    visit('/')
    submit_peep
    expect(page.current_path).to eq '/profile'
    expect(page).to have_content 'My first test peep!'
  end

  scenario 'expect homepage to have display peeps when logged out' do
    visit('/')
    submit_peep
    click_button 'Log out'
    expect(page.current_path).to eq '/'
    expect(page).to have_content 'My first test peep!'
  end
end
