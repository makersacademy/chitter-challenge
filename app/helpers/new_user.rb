def user_valid?
  keys = ['name', 'handle', 'email', 'password']
  keys.each do |key|
    return false unless params.keys.include?(key)
  end
  
  params.each do |key, value|
    next unless keys.include?(key)
    return false if value.length.zero?
  end

  true
end
