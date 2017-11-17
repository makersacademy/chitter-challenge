def sign_up_and_peep(content: '')
  sign_up
  peep(content: content)
end

feature 'Feature: peeping' do
  context 'when not logged in' do
    before(:each) { Capybara.current_driver = :rack_test }

    scenario 'user tries to peep when not logged in' do
      visit('/peep/new')
      expect(page.status_code).to eq 401
    end
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
