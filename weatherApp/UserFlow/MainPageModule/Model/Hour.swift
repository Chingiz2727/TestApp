struct Hour: Codable {
  let time_epoch: Int
  let time: String
  let temp_c: Double
  let temp_f: Double
  let is_day: Int
  let condition: Condition
  let wind_mph: Double
  let wind_kph: Double
  let wind_degree: Int
  let wind_dir: String
  let pressure_mb: Int
  let pressure_in: Double
  let precip_mm: Int
  let precip_in: Int
  let humidity: Int
  let cloud: Int
  let feelslike_c: Double
  let feelslike_f: Double
  let windchill_c: Double
  let windchill_f: Double
  let heatindex_c: Double
  let heatindex_f: Double
  let dewpoint_c: Double
  let dewpoint_f: Double
  let will_it_rain: Int
  let chance_of_rain: String
  let will_it_snow: Int
  let chance_of_snow: String
  let vis_km: Int
  let vis_miles: Int
  let gust_mph: Double
  let gust_kph: Double
}
