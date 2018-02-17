feature 'Cheets visible on homepage' do
  scenario 'on homepage, seeing cheet titles and text' do
    visit '/cheets'
    expect(page).to have_content 'My third DataMapper post'
    expect(page).to have_content "Some more text ..."
  end
end
