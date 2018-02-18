feature 'displays list of peeps' do
  scenario 'the user can see a list of previous peeps' do
    visit '/'
    expect(page).to have_content 'This is a message!'
  end
end
