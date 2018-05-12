require_relative '../../app.rb'
require 'spec_helper'
require 'pg'

feature Chitter do

  feature 'Viewing all peeps' do
    scenario 'User is able to see all peeps' do
      Peep.set_database.exec("INSERT INTO peeps (text, author) VALUES('Hello World!', 'Sam Worrall')")
      visit('/')
      expect(page).to have_content "Sam Worrall: Hello World!"
    end
  end
end
