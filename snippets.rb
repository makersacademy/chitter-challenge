def html_constructor(tag, attributes, inner_html)
  attributes_string = String.new
  attributes.each { |attr, value| attributes_string << "#{attr}='#{value}' " }
  "<#{tag} #{attributes_string}>#{inner_html}</#{tag}>"
end

img = html_constructor('img', { src: 'http://michael-jacobson.co.uk/red_heart.png', class: 'heart_image' }, 'Test!')
div = html_constructor('div', { class: 'likes_red' }, img)
puts html_constructor('a', { href: '#', class: 'unlike', id: '#{post.id}' }, div)
