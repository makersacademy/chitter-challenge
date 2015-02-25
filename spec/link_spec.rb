require 'spec_helper'

describe Link do
  
  context 'demonstration of how data_mapper works' do
    
      it 'should be created and retrieved from the database' do
        expect{Link.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')}.to change{Link.count}.by 1
      end

      it 'should display the first link' do
        Link.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
        link = Link.first
        expect(link.url).to eq 'http://www.makersacademy.com'
        expect(link.title).to eq 'Makers Academy'         
      end

  end
end