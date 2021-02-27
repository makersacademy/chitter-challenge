feature 'Viewing the Chitter feed' do
  scenario 'A user can see the comment feed' do
    Chitter_Page.create(comment: 'I am having a lovely day')
    Chitter_Page.create(comment: 'Not so much of a weekend though')


    visit '/chitter_feed'

    expect(page).to have_content('I am having a lovely day')
    expect(page).to have_content('Not so much of a weekend though')
    end
  end
