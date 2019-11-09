feature 'visiting homepage' do
  scenario 'User goes to homepage' do
    visit('/')
    expect(page).to have_content "Chitter"
    expect(page).to have_content "A place to peep what everyone's thinking."
  end
end
