struct Current: Codable {
  let last_updated_epoch: Int
  let last_updated: String
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
  let vis_km: Int
  let vis_miles: Int
  let uv: Int
  let gust_mph: Double
  let gust_kph: Double
}
