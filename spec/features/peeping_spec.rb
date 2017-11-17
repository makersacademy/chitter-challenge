def sign_up_and_peep(content: '')
  sign_up
  peep(content: content)
end

# selenium does not seem to support status codes...
Capybara.current_driver = :rack_test

feature 'Feature: peeping' do
  scenario 'user tries to peep when not logged in' do
    visit('/peep/new')
    expect(page.status_code).to eq 401
  end

  scenario 'users peeps with no content' do
    sign_up_and_peep(content: '')
    expect(page.current_path).to eq '/peep/new'
  end

  scenario 'users peeps when logged in' do
    sign_up_and_peep
    within 'li' do # TODO more specific?
      expect(page).to have_content 'some text'
    end
  end
end
