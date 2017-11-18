def sign_up_and_peep(content: 'some text')
  sign_up
  peep(content: content)
end

feature 'Feature: peeping' do
  context 'when not logged in' do
    scenario 'user tries to peep when not logged in' do
      visit('/peeps/new')
      expect(page.status_code).to eq 401
    end
  end
  
  context 'when logged in' do
    scenario 'users peeps with no content' do
      sign_up_and_peep(content: nil)
      expect(page).to have_content 'Peep cannot be blank'
    end

    scenario 'users peeps when logged in' do
      sign_up_and_peep
      expect(page.first(:xpath, '//div[@class="peep"]'))
        .to have_content 'some text'
    end
  end
end
