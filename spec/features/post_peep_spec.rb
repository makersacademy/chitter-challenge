feature 'post a peep' do
  scenario 'user can post a peep and see it on the page' do
    visit('/peeps')

    fill_in 'message', with: 'peep peep'
    click_on 'Post'

    expect(page).to have_content 'peep peep'
  end
end