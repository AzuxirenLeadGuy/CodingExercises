package app.omnicorp.core

import java.time.Instant
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap

@JvmInline
value class PolyglotSearcherRankerSussySchedulerStackToken(val raw: String) {
    init {
        require(raw.isNotEmpty()) { "Token cannot be empty" }
    }
}
