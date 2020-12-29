require 'spec_helper'


feature 'Adding ' do
    it 'Can add a new peep ' do
      visit ('chitter/new')
        fill_in('peep', with: 'Hi guys')
        click_button'Post'
        expect(page).to have_content 'Hi guys'
      end
    end
