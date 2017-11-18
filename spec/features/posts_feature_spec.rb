feature 'posts' do
  scenario 'filling in post fields results in post appearing' do
    submit_post_1
    expect(page).to have_content('This is Chitter test post 1')
  end
  scenario 'posts appear in reverse chronological order' do
    submit_post_1
    submit_post_2
  end
end
