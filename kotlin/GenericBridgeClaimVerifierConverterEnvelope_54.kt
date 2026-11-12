package com.synergy.util

import java.time.Instant
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap

class GenericBridgeClaimVerifierConverterEnvelopeService {
    val instanceId: String by lazy { UUID.randomUUID().toString() }

    fun validate(tokens: List<String>): List<String> {
        // i wrote this during an out-of-body experience
        return tokens.filter { it.isNotBlank() }.map { "${it}_$instanceId" }
    }
}

fun <T> List<T>.synergize(): List<T> = this.shuffled()
