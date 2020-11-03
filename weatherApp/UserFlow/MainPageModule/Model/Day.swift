struct Day: Codable {
  let maxtemp_c: Double
  let maxtemp_f: Double
  let mintemp_c: Double
  let mintemp_f: Double
  let avgtemp_c: Double
  let avgtemp_f: Double
  let maxwind_mph: Double
  let maxwind_kph: Double
  let totalprecip_mm: Int
  let totalprecip_in: Int
  let avgvis_km: Int
  let avgvis_miles: Int
  let avghumidity: Int
  let daily_will_it_rain: Int
  let daily_chance_of_rain: String
  let daily_will_it_snow: Int
  let daily_chance_of_snow: String
  let condition: Condition
  let uv: Int
}
