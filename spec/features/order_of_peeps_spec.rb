feature 'Order of peeps' do
  scenario 'Peeps are displayed in reverse chronological order' do
    first_string = 'Hello everybody!'
    second_string = 'Programming has never been more fun'
    visit('/')
    fill_in('peep', with: first_string)
    click_button('Submit')
    fill_in('peep', with: second_string)
    click_button('Submit')
    expect(second_string).to appear_before(first_string)
  end
end
