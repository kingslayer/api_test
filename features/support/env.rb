require 'httparty'
require 'json'

$default_parameters = {:station => 'QATESTING', :length => '30', :zip => '10010', :adType => 'audio'}

def http_get(query)
  HTTParty.get('http://api.targetspot.com/tod.php', :query => query)
end

def get_audio_format(json)
  JSON.parse(json.body)['TOD']['AdBreaks']['AdBreak'][0]['Ad'][0]['MediaFile']['type']
end

def get_error_code(json)
  JSON.parse(json.body)["TOD"]["Error"]["errorCode"]
end

def get_image_size(json)
  source = JSON.parse(json.body)["TOD"]["AdBreaks"]["AdBreak"][0]["Ad"][0]["CompanionVisual"]["MediaFile"][0]
  #source["height"]
 # source["width"]
end
