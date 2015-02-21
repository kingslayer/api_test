Given(/^I query TOD with the following parameters: "(.*?)", "(.*?)", "(.*?)", "(.*?)"$/) do |station, length, zip, adtype|
  params = {:station => station, :length => length, :zip => zip, :adType => adtype}
  @response = http_get(params)
end

Then(/^I should observe that TOD responded with the error code: "(.*?)"$/) do |code|
  get_error_code(@response).to_s.should == code
end

Given(/^I query TOD with default parameters and an audioFormat value of: "(.*?)"$/) do |format|
  params = $default_parameters.merge(:audioFormat => format)
  @response = http_get(params)
end

Then(/^I should observe that TOD returned the corresponding media type: "(.*?)"$/) do |type|
  get_audio_format(@response) == type
end

Given(/^I query TOD with default parameters and a companionWidth of "(.*?)" and companionHeight of "(.*?)"$/) do |width,height|
  params = $default_parameters.merge(:companionHeight => height, :companionWidth => width)
  @response = http_get(params)
end

Then(/^I should observe that TOD returned a MediaFile with a width of "(.*?)" and a height of "(.*?)"$/) do |width,height|
  json = get_image_size(@response)
  json["width"].to_s.should == width
  json["height"].to_s.should == height
end
