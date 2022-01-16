feature 'post a peep' do
  scenario 'user can post a peep and see it on the page' do
    visit('/peeps')

    fill_in 'message', with: 'peep peep'
    click_on 'Post'

    expect(page).to have_content 'peep peep'
  end

  scenario 'user can post multiple peeps and see them in reverse order' do
    visit('/peeps')

    fill_in 'message', with: 'peep one'
    click_on 'Post'

    fill_in 'message', with: 'peep two'
    click_on 'Post'

    fill_in 'message', with: 'peep three'
    click_on 'Post'

    expect(page).to have_content 'peep three peep two peep one'
  end
end