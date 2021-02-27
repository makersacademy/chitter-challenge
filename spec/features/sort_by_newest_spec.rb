feature 'To see messages in reverse chronogical order' do
  scenario 'user clicks "sort by newest" button' do
    oldest_peep = Peep.create(peep: 'I am the oldest message ever!').peep
    middle_peep = Peep.create(peep: 'I am the middle child :(').peep
    baby_peep = Peep.create(peep: 'I am the baby!!').peep

    visit '/'

    expect(page).to have_content(oldest_peep)
    expect(page).to have_content(middle_peep)
    expect(page).to have_content(baby_peep)

    click_button('Sort peeps by most recent')
    expect(current_path).to eq('/sorted-by-newest')
    expect(page).to have_content("#{baby_peep} #{middle_peep} #{oldest_peep}")
  end
end
