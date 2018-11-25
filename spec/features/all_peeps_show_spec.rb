require 'pg'

feature 'list of peeps on homepage' do
  scenario 'user can see a list of peeps on the homepage' do

    Peeps.create(content: 'Is this working?', time: Time.new)
    Peeps.create(content: 'I overshare on social media!', time: Time.new)
    Peeps.create(content: 'Does this have a different timestamp.', time: Time.new)

    visit('/')

    expect(page).to have_content "Is this working?"
    expect(page).to have_content "I overshare on social media!"
    expect(page).to have_content "Does this have a different timestamp."
  end
end
