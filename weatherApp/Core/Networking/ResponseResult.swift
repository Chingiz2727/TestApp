import Willow

enum Result<A> {
    case value(A)
    case error(ApiResponseError)
    
    var error: ApiResponseError? {
        switch self {
        case .error(let b):
            return b
        default:
            return nil
        }
    }
    
    var value: A? {
        switch self {
        case .value(let a):
            return a
        default:
            return nil
        }
    }
}
