enum AppError: Error {
    case missingData
    case serverError(Error)
    case sessionExpired
    case notReachable
}
