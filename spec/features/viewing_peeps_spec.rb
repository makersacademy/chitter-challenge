#dont need to require app.rb as its required in the spec helper.

feature 'Viewing peeps' do
  scenario 'visting the index page' do
    visit('/')
    expect(page).to have_content "Peeps view page"
  end
end
