feature "viewing peeps" do
  scenario "user sees peeps on the homepage" do

    Peep.create(text: 'Test peep')

    visit('/')
    expect(page).to have_content 'Test peep'

  end
end
