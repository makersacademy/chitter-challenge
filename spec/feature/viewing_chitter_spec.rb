feature 'viewing chitter' do
  scenario 'visiting the index page' do
    visit('/peeps')

    expect(page).to have_content "I love Chitter!"
    expect(page).to have_content "How do I peep?"
    expect(page).to have_content "This is so fun."

  end

end
