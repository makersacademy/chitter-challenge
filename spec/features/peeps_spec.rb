feature 'viewing and posting peeps' do

  scenario 'it posts a peep' do
    visit('/peeps')
    fill_in 'peep', with: 'Hello, this is my first peep on Chitter!'
    click_button 'Post'
    expect(page).to have_content('Hello, this is my first peep on Chitter!')
  end

end
