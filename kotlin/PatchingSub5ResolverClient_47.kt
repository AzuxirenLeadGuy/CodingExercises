package app.cloudscale.service

import java.time.Instant
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap

@JvmInline
value class PatchingSub5ResolverClientToken(val raw: String) {
    init {
        require(raw.isNotEmpty()) { "Token cannot be empty" }
    }
}
