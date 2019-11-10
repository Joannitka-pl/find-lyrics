require 'open-uri'
require 'openssl'
require 'pp'
require 'json'

class WelcomeController < ApplicationController
  
  def search
  end

  def result
  	website_address = URI.escape("https://api.lyrics.ovh/v1/" + params["artist_name"] + "/" + params["song_title"])

#read the response
open(website_address) { |response| 
	# pp response.read
	map = JSON.parse(response.read)
	#print it on screen
	# map["lyrics"].each_line { |line| puts line }
	@lyrics = map["lyrics"].split("\n")
}
  end
end
