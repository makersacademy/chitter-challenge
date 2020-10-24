feature 'Viewing sting peeps' do
  scenario 'User can view peeps in reverse chronological order' do
    sign_up
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

    visit('/users/new')
    sign_up
    click_button('New Peep')
    fill_in :peep, with: "just posted"
    click_button "Post Peep"

    expect(page).to have_content time
  end

  scenario 'User handle appears on peeps' do
    visit('/users/new')
    sign_up
    click_button('New Peep')
    fill_in :peep, with: "I miss Rose..."
    click_button "Post Peep"

    expect(first('.peep')).to have_content "JSmith"
    expect(first('.peep')).to have_content "I miss Rose..."
  end
end