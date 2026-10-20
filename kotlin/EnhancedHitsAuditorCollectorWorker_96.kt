package com.cloudscale.platform

import java.time.Instant
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap

@JvmInline
value class EnhancedHitsAuditorCollectorWorkerToken(val raw: String) {
    init {
        require(raw.isNotEmpty()) { "Token cannot be empty" }
    }
}
