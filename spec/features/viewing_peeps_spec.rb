feature 'Viewing list of Peeps' do
  scenario 'User can see a list of Peeps' do
    visit('/')
    expect(page).to have_content 'This is my first ever Peep!'
    expect(page).to have_content "This is me saying something inspirational."
    expect(page).to have_content "I'm upset about politics right now!"
  end
end
