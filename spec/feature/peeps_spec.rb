feature 'peeps' do
  scenario 'shows peeps' do
    visit '/peeps'
    expect(page).to have_content 'Sign up or log in if you want to post a peep or click here to see all the peeps'
    expect(page).to have_content 'Peeeeeeps!'
  end
end
