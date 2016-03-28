# require 'web_helper'

feature 'User chitter experience' do
  include Helpers
  context 'User can peep' do
    before do
      visit '/'
      sign_up
      sign_in
      fill_in('message', with: 'Winter is comming!')
    end

    scenario ' when logged in' do
      expect{ click_button('Peep') }.to change(Peep, :count).by(1)
      within 'article#peeps' do
        expect(page).to have_content('Winter is comming!')
        expect(page).to have_content("ghost peeped")
      end
    end

    # scenario 'peeps are limited to 140 chars' do
    # end
  end

  context 'User cannot peep' do
    scenario 'with no message' do
      sign_up
      sign_in
      expect{ click_button('Peep') }.not_to change(Peep, :count)
    end

    scenario 'if not logged in' do
      visit('/home')
      expect(page).not_to have_css('div.peop')
      expect(page).not_to have_content('Peep something')
    end
  end

  scenario 'peeps are displayed in reversed order' do
    visit '/'
    sign_up
    sign_in
    fill_in('message', with: 'Winter is comming!')
    click_button('Peep')
    fill_in('message', with: 'Who is my mother?')
    click_button('Peep')
    expect('Who is my mother?').to appear_before 'Winter is comming!'
  end

  feature 'On Chitter page' do
    context 'Not logged in' do
      before(:each) do
        visit('/home')
      end

      scenario 'User can sign in' do
        click_button('Sign in')
        expect(current_path).to eq('/sessions/new')
      end

      scenario 'User can sign up' do
        click_button('Sign up')
        expect(current_path).to eq('/users/new')
      end

    end
  end
end
