#!/usr/bin/env ruby
  def validateParams(lat, long, type)
    validation = Hash.new
    lat_validation = /^-?([1-8]?\d(?:\.\d{1,})?|90(?:\.0{1,6})?)$/
    long_validation = /^-?((?:1[0-7]|[1-9])?\d(?:\.\d{1,})?|180(?:\.0{1,})?)$/

    unless lat_validation ===  lat
      validation = { :code => 301, :message => "Latitude is invalid"}
    end
    unless long_validation === long
      validation = { :code => 301, :message => "Longitude is invalid"}
    end
    unless type == 'bank'|| type == 'atm'|| type == 'all'
      validation = { :code => 301, :message => "Type is invalid"}
    end

    puts validation unless validation.empty?
    return true if validation.empty?
  end
