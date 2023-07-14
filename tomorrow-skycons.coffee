weatherCodes = {
  "0": "Unknown",
  "1000": "Clear",
  "1100": "Mostly Clear",
  "1101": "Partly Cloudy",
  "1102": "Mostly Cloudy",
  "1001": "Cloudy",
  "2000": "Fog",
  "2100": "Light Fog",
  "4000": "Drizzle",
  "4001": "Rain",
  "4200": "Light Rain",
  "4201": "Heavy Rain",
  "5000": "Snow",
  "5001": "Flurries",
  "5100": "Light Snow",
  "5101": "Heavy Snow",
  "6000": "Freezing Drizzle",
  "6001": "Freezing Rain",
  "6200": "Light Freezing Rain",
  "6201": "Heavy Freezing Rain",
  "7000": "Ice Pellets",
  "7101": "Heavy Ice Pellets",
  "7102": "Light Ice Pellets",
  "8000": "Thunderstorm"
}

getIcon = (weatherCode, windSpeed) ->
  icon = switch weatherCode
    when "1000", "1100" then "CLEAR"
    when "1101", "1102" then "PARTLY_CLOUDY"
    when "1001" then "CLOUDY"
    when "2000", "2100" then "FOG"
    when "4000", "4001", "4200", "4201", "8000" then "RAIN"
    when "5000", "5001", "5100", "5101" then "SNOW"
    when "6000", "6001", "6200", "6201", "7000", "7101", "7102" then "SLEET"
    else "UNKNOWN"
  
  if windSpeed >= 9 && (icon = "CLEAR" || icon = "PARTLY_CLOUDY" | icon = "CLOUDY")
    icon = "WIND"
  else if icon = "CLEAR" || icon = "PARTY_CLOUDY"
    hour = new Date().getHours()
    if hour < 7 && hour > 19
      icon = icon + '_NIGHT'
    else
      icon = icon + '_DAY'
