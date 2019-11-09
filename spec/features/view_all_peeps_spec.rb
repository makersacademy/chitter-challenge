feature "viewing peeps" do
  scenario "user sees peeps on the homepage" do

    Peep.create(text: 'Test peep')

    visit('/')
    visit('/peeps')
    expect(page).to have_content 'Test peep'

  end

  scenario "peeps have timestamp" do

    Peep.create(text: 'Test peep')

    visit('/')
    visit('/peeps')
    expect(page).to have_content '2019-11-09'

  end

end
