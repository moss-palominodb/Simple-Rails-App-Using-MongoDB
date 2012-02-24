#!/usr/bin/env ruby

HOST_AND_PORT = "localhost:3000"

def get_name
  ['Chocolate Cake',
   'Pumpkin Pie',
   'Mashed Potatoes',
   'Strawberry Milkshake'].sample
end

def get_stuff
  ['glass water', 'tablespoon vanilla', 'cup flour', 'stick butter'].sample 
end

(1..20).each do |num|
  command_string = "curl -d recipe[name]=\"#{get_name} #{num}\" -d action=create http://#{HOST_AND_PORT}/admin/recipes"
  name = get_name
  (1..5).each do |amount|
    stuff = get_stuff
    command_string << " -d i[][amount]=#{amount} -d i[][stuff]=\"#{get_stuff}\""
  end
  `#{command_string}`
end
