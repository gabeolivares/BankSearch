#!/usr/bin/env ruby
require 'google_places'

API_KEY = 'AIzaSyDZmfTi84w3ZXRiJUCIz0F7YZ8uf1i4TJo'
CLIENT = GooglePlaces::Client.new(API_KEY)

class BankSearch
  attr_reader :lat
  attr_reader :long
  attr_reader :type
  attr_reader :valid

  def initialize(lat, long, type)
    @lat = lat
    @long = long
    @type = type.downcase
    @valid = validSearch
  end

  def search
    if @valid == true
      response = Hash.new
      if @type == 'all'
        results = CLIENT.spots(@lat, @long, :types => ['bank','atm'], :radius => 50000)
        result_arr = []
        results.first(10).each do |r|
          name = r.name
          lat= r.lat
          lng = r.lng
          result_arr.push({:name => name, :latitude => lat, :longitude => lng })
        end

        response = { :code => 200, :message => result_arr}

      else
        results = CLIENT.spots(@lat, @long, :types => @type, :radius => 50000)
        result_arr = []
        results.first(5).each do |r|
          name = r.name
          lat= r.lat
          lng = r.lng
          result_arr.push({:name => name, :latitude => lat, :longitude => lng })
        end
        response = {:code => 200, :message => result_arr}
      end

      p response
    end
  end

  def validSearch
    lat_validation = /^-?([1-8]?\d(?:\.\d{1,})?|90(?:\.0{1,6})?)$/
    long_validation = /^-?((?:1[0-7]|[1-9])?\d(?:\.\d{1,})?|180(?:\.0{1,})?)$/
    checkLat = long_validation === @long
    checkLong = lat_validation ===  @lat
    checkType = @type == 'bank'|| @type == 'atm'|| @type == 'all'

    if checkLat == true && checkLong == true && checkType == true
      return true
    else
      return false
    end
  end
end
