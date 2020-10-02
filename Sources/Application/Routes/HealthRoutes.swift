import LoggerAPI
import Health
import KituraContracts

func initializeHealthRoutes(app: App) {
    
    app.router.get("/health") { (respondWith: (Status?, RequestError?) -> Void) -> Void in
        if health.status.state == .UP {
            respondWith(health.status, nil)
        } else {
            respondWith(nil, RequestError(.serviceUnavailable, body: health.status))
        }
    }
    
    app.router.head("/health") { (request, response, next) in
        if health.status.state == .UP {
            response.status(.OK)
        } else {
            response.status(.serviceUnavailable)
        }

        next()
    }
}
