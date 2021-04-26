# frozen_string_literal: true

require 'spec_helper'

feature 'Viewing the homepage' do
  scenario 'Loading Index' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
  end
end
