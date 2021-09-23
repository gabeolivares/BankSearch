#!/usr/bin/env ruby
require './bank_search.rb'
require './custom_validator.rb'

puts '============================================'
puts 'Welcome to the Bank and ATM Search Script'
puts '============================================'

prompt = '> '
puts "Please enter your latitude.", prompt
lat = $stdin.gets.chomp

puts "Please enter your longitude.", prompt
long = $stdin.gets.chomp

puts "Would you like to search for a bank, atm, or all?" 
puts "Please type: 'bank', 'atm', or 'all'.", prompt
type = $stdin.gets.chomp.downcase

if validateParams(lat, long, type) == true
  bank = BankSearch.new(lat, long, type)
  bank.search
end
