feature 'Viewing chitter' do
  scenario 'visiting the homepage' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end

  scenario 'A user can see cheeps' do

    cheep = Cheep.create(text: 'first cheep')
    Cheep.create(text: 'second cheep')
    Cheep.create(text: 'third cheep')

    visit '/cheeps'

    expect(page).to have_content "first cheep"
    expect(page).to have_content "second cheep"
    expect(page).to have_content "third cheep"
  end
end
