feature 'comment' do
  scenario 'each peep has a link to restful page' do
    add_peep('hello')
    expect(page).to have_link('hello', href: '/peeps/1')
  end

  scenario 'each peep has its own url and text' do
    add_peep('hello')
    click_link('hello')
    expect(current_path).to eq('/peeps/1')
    expect(page).to have_content('hello')
  end

  scenario 'Go Back button returns to index' do
    add_peep('hello')
    click_link('hello')
    click_button('Go Back')
    expect(current_path).to eq('/peeps')
  end
end
