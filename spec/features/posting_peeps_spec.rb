feature 'Posting peeps' do
  scenario 'there is a form for users to use to post peeps' do
    visit('/comment')

    expect(page).to have_css('#comment')
  end


end
