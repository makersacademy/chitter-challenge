require 'Date'
feature 'testing the "peeping" feature' do
  scenario 'submits the message' do
    submit_message
    expect(page).to have_content('Anonymous')
    expect(page).to have_content('Today I had air for lunch. The flavour was exquisite.')
  end
end
