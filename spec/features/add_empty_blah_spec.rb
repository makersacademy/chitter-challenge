feature 'Add a empty blah' do
  scenario 'An error occurs if a empty message is posted' do
    sign_up
    click_button('New blah')
    click_button('Add blah')

    expect(page).to have_content('You must enter some text!')
  end
end
