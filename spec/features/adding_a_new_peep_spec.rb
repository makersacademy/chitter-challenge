feature 'adding a new_peep' do
  scenario 'you can see your new_peep' do
    visit('/')
    fill_in('peep', with: 'Hello world')
    click_button('Tell The World')
    expect(page).to have_content 'Hello world'
  end

  scenario 'you can see the time of your peep' do
    time_match = Peep.new_peep(username: 'charliecodes', peep: 'dummy peep')
    visit('/')
    fill_in('peep', with: 'Time checking peep')
    click_button('Tell The World')
    expect(page).to have_content time_match.time
  end
end
