require 'hue'
require 'byebug'

client = Hue::Client.new

lights = client.lights
lights.each do |l|
  puts l.name
  puts l.software_version
  puts l
end



# -> https://github.com/soffes/hue/blob/master/lib/hue/light.rb

li = lights.last
# byebug
transition_time = 10*5 # 5secs
li.set_state({:color_temperature => 100}, transition_time)
li.set_state({:color_temperature => 600}, transition_time)
li.off!
sleep 2
li.on!



# light = client.lights.first
# light.on!
# light.hue = 46920
# light.color_temperature = 100
# transition_time = 10*5 # Hue transition times are in 1/10 of a second.
# light.set_state({:color_temperature => 400}, transition_time)
# Groups
# # Fetching
# group = client.groups.first
# group = client.group(1)

# # Accessing group lights
# group.lights.first.on!
# group.lights.each { |light| light.hue = rand(Hue::Light::HUE_RANGE) }

# # Creating groups
# group = client.group # Don't specify an ID
# group.name = "My Group"
# group.lights = [3, 4] # Can specify lights by ID
# group.lights = client.lights.first(2) # Or by Light objects
# group.new? # => true
# group.create! # Once the group is created, you can continue to customize it
# group.new? # => false

# # Destroying groups
# client.groups.last.destroy!