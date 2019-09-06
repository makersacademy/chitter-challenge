feature 'Chitter' do
  scenario 'I can post a message (peep) to chitter' do
    visit '/new'
    fill_in('peep', with: 'Coding is fun!')
    click_button('Post')
    expect(page).to have_content('Coding is fun!')
    expect(page).to have_content(/(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})/)
  end

  scenario 'I can see all peeps in reverse chronological order' do
    Peep.create(peep: 'Coding is fun!')
    Peep.create(peep: 'Ruby is a gem if you know it!')
    Peep.create(peep: "That's one small step for man, one giant leap for mankind.")
    visit '/'
    expect(page).to have_content('Coding is fun!')
    expect(page).to have_content('Ruby is a gem if you know it!')
    expect(page).to have_content("That's one small step for man, one giant leap for mankind.")
  end
end
