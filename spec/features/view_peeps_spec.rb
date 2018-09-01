feature 'can see all peeps' do
  scenario 'see all peep messages' do
    visit '/peeps'

    expect(page).to have_content "Hello"
    expect(page).to have_content "Hi"
    expect(page).to have_content "Hey"

  end
end
