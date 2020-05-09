feature 'post peep' do
  scenario 'as a user able to post' do
    visit('/chitter')
    fill_in 'peep', with: 'First peep'
    click_button 'Post Peep'

    expect(page).to have_content 'First peep'
  end

end
