require 'spec_helper'

feature 'allowing links to have tags' do
  
  scenario 'with a few tags ' do
    visit "/"
    add_link("http://www.makersacademy.com/",
                 "Makers Academy",
                 ['education', 'ruby'])
    link = Link.first
    expect(link.tags.map(&:text)).to include("education")
    expect(link.tags.map(&:text)).to include("ruby")
  end

   def add_link(url, title, tags = [])
     within('#new-link') do
      fill_in 'url', :with => url
      fill_in 'title', :with => title
       # our tags will be space separated
      fill_in 'tags', :with => tags.join(' ')
      click_button 'Add link'
     end
   end
end