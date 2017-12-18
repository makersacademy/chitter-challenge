feature "posting peeps" do
  before do
    sign_up
    sign_in
  end
  scenario "a user should post a peep and have it appear on the page" do
    post_peep
    expect(page).to have_content("my test peep")
  end

  scenario 'peeps should say who created them' do
    post_peep
    expect(page).to have_content("tester")
  end

  scenario 'peeps should be sorted by time, newest first' do
    post_peep(peep: 'first_peep')
    post_peep(peep: 'second_peep')
    expect('second_peep').to appear_before('first_peep')
  end

  scenario 'the user should be able to tag peeps' do
    post_peep(tags:'mytag')
    expect(page).to have_content('mytag')
  end

end
