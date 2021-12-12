feature 'Posting a message (peep)' do
  scenario 'A user can post a message to the home page' do
    visit ('/')
    fill_in 'peep-body', with: 'this is my first post'
    click_on 'Peep' # submit's the post

    expect(page).to have_content 'this is my first peep'

  end


end