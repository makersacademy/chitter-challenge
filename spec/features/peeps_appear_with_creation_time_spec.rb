feature 'peep creation time' do
  scenario 'each peep appears with the time it was submitted' do
    visit('/')
    fill_in 'peep', with: "I love peeping! but now I'm hungry.."
    click_button 'wall it!'
    time = Peep.all[0].creation_time.strftime("%a %b %d, %H:%M")
    expect(page).to have_content(time)
  end
end
