# require '../../app.rb'

feature 'viewing chit' do

  scenario 'viewing the index page and getting a list of chits' do
    visit('/')
    expect(page).to have_content("help I'm tired yo")
    expect(page).to have_content("Can I just shock you? I like wine")
    expect(page).to have_content("My cat was right about you")
  end
end
