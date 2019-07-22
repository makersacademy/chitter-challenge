
feature 'post' do
  scenario 'should be able to post a cheet' do
    visit('/post')
    fill_in('message', with: 'Hello')
    click_button('Submit')
    expect(page).to have_content 'Hello'
  end
end
