feature 'peeps are time stamped' do
  # As a social media user
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made
  scenario 'A user can see the time the peep was created on screen' do
    visit('/peeps')
    click_button('Add peep')
    fill_in('text', :with => 'space is black')
    click_button('Submit')
    expect(page).to have_content('space is black')
  end
end
