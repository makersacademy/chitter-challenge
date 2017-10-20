feature 'Sharing new tips' do
  scenario 'On the new post page I can share a tip' do
    make_new_post

    within 'div#posts'
    expect(page).to have_content 'Remember to eat your greens!'
  end
end
