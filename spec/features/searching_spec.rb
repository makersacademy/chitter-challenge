feature 'Feature: user can search for various items' do
  scenario 'user can find search page' do
    populate_peeps(10)
    peep(content: '#hello')
    click_button('Search')
    fill_in('tag', with: 'hello')
    fill_in('user', with: 'example')
    click_button('Submit')
    expect(page.first(:xpath, '//div[@class="peep"]')).to have_content '#hello'
  end
end
