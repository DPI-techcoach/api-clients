class GmapsWrapper
  # attr_accessor :user_location

  def GmapsWrapper.apicall(user_location)
    gmaps_key = "AIzaSyAgRzRHJZf-uoevSnYDTf08or8QFS_fb3U"
    
    gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{gmaps_key}"

    # p "Getting coordinates from:"
    # p gmaps_url

    raw_gmaps_data = URI.open(gmaps_url).read

    parsed_gmaps_data = JSON.parse(raw_gmaps_data)

    results_array = parsed_gmaps_data.fetch("results")

    first_result_hash = results_array.at(0)

    geometry_hash = first_result_hash.fetch("geometry")

    location_hash = geometry_hash.fetch("location")
    
    latitude = location_hash.fetch("lat")

    longitude = location_hash.fetch("lng")

    return latitude,longitude
  end
end
