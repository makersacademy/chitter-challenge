require 'mail'
require_relative 'models/notification'

Mail.defaults do
  delivery_method :smtp, address: "localhost", port: 1025
end
