feature 'Viewing the homepage' do
  scenario 'A the page title is visible' do 
    visit ('/')

    expect(page).to have_content 'Welcome to Chitter'
  end
end 

feature 'View all Peeps' do
  scenario 'A user can view all previous Peeps' do
    visit ('/peeps')

    expect(page).to have_content 'Elon who?'
    expect(page).to have_content 'COYS'
    expect(page).to have_content 'How almost two o\'clock is it?'
  end
end