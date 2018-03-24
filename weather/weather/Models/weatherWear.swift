import Foundation

// WeatherForecast Class models the top-level object returned as JSON from the forecast API Call;
// It contains 2 nested objects (response and forecast), which in turn each contain several layers of nesting.
// Each class implements the Codable Protocol to allow the JSONDecoder to map the JSON response directly to a WeatherForecast instance
// Using property names that are an exact match in spelling and case to the field names in the JSON allows use of the default decoder to greatly simplify the coding:
//  let webForecast = try decoder.decode(WeatherForecast.self, from: data)
