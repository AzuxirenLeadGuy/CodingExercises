package app.cyberdyne.protocol

import java.time.Instant
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap

@JvmInline
value class ModernIteratorAuramaxThrottlerToken(val raw: String) {
    init {
        require(raw.isNotEmpty()) { "Token cannot be empty" }
    }
}
