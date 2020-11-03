struct Forecast: Codable {
  let forecastday: [Forecastday]
}

// MARK: - Forecastday
struct Forecastday: Codable {
  let date: String
  let date_epoch: Int
  let day: Day
  let astro: Astro
  let hour: [Hour]
}
