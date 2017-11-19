feature 'posts' do

  scenario 'filling in post fields results in post appearing' do
    sign_up
    sign_in
    submit_post_1
    expect(page).to have_content('This is Chitter test post 1')
  end
  scenario 'page returns the time' do
    allow(Time).to receive(:now).and_return('2017-11-18 17:02:05 +0000')
    sign_up
    sign_in
    submit_post_1
    expect(page).to have_content('Posted at 17:02:05 on 18-11-2017')
  end
  # scenario 'posts appear in reverse chronological order' do
  #   submit_post_1
  #   submit_post_2
  # end
end
