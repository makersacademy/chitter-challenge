# require '../../app.rb'

feature 'viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content("This is Chitter")
  end

  scenario 'getting a list of chits' do
    visit('/')
    expect(page).to have_content("Help I'm tired yo")
    expect(page).to have_content("Can I just shock you? I like wine")
    expect(page).to have_content("My cat was right about you")
  end
end
