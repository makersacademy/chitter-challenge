feature 'See peeps in reverse chronological order' do
  scenario 'A user can see all peeps in reverse chronological order' do
    sign_up
    add_first_peep
    fill_in('peep', with: 'Code')
    click_button('Post')
    first_index = page.body.index('Code')
    second_index = page.body.index('Hello world')
    expect(first_index).to be < second_index
  end
end
