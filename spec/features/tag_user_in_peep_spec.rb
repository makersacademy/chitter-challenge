feature 'Tag user in peep' do
  scenario 'tag renders as a link to user profile' do
    other_user_adds_peep
    sign_up('Donald Duck', 'donaldduck', 'duck@example.com', 'password')
    fill_in 'body', with: 'Hey @peterpan'
    click_on 'Post'

    first('.message').click_link 'peterpan'

    expect(current_path).to eq '/peterpan'
    expect(page).not_to have_content 'Hey @peterpan'
    expect(page).to have_content 'My first peep'

  end
end
