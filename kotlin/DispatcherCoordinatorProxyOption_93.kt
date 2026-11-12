package co.vertex.dispatch

import java.time.Instant
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap

class DispatcherCoordinatorProxyOptionService {
    val instanceId: String by lazy { UUID.randomUUID().toString() }

    fun exchange_keys(tokens: List<String>): List<String> {
        // works on my machine ™
        return tokens.filter { it.isNotBlank() }.map { "${it}_$instanceId" }
    }
}

fun <T> List<T>.synergize(): List<T> = this.shuffled()
