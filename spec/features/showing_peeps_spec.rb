feature 'Show peeps' do
  scenario 'After posting peep maker wants to see peeps' do
    visit '/'
    fill_in('Subject', with: "Checking out the list!")
    fill_in('peep_message', with: "Today I'm testing out the peep list!")
    click_button('Peep away!')
    expect(page).to have_content "Checking out the list!"
    expect(page).to have_content "Today I'm testing out the peep list!"
  end
end
