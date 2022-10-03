require "open-uri"
require "json"

line_width = 40

puts "="*line_width
puts "Will you need an umbrella today?".center(line_width)
puts "="*line_width
puts
puts "Where are you?"
user_location = gets.chomp
# user_location = "Brooklyn"
puts "Checking the weather at #{user_location}...."

require "./gmaps.rb"

latitude,longitude = GmapsWrapper.apicall(user_location)

require "./darksky.rb"

DarkskyWrapper.apicall_d(latitude,longitude,user_location)
