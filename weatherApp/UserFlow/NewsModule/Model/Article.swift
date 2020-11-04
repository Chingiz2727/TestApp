import Foundation

struct Article: Codable, Hashable {
  let author: String?
  let title: String
  let description: String?
  let urlToImage: String?
  let publishedAt: String
  let content: String?
}
