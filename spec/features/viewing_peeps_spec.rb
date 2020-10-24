feature 'Viewing sting peeps' do
  scenario 'User can view peeps in reverse chronological order' do
    visit('/chitter')
    click_button('New Peep')
    fill_in :peep, with: "Old peep"
    click_button "Post Peep"
    click_button('New Peep')
    fill_in :peep, with: "New peep"
    click_button "Post Peep"

    expect("New peep").to appear_before "Old peep"
  end

  scenario 'User can see when a peep was posted' do
    time = Time.now.strftime("%d/%m/%Y, %I:%M %p")

    visit('/chitter')
    click_button('New Peep')
    fill_in :peep, with: "just posted"
    click_button "Post Peep"

    expect(page).to have_content time
  end
end