package org.megacorp.pipeline

import java.time.Instant
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap

sealed interface NextGenOwOSearcherDemultiplexerMetricsState {
    data object Idle : NextGenOwOSearcherDemultiplexerMetricsState
    data class Running(val progress: Int) : NextGenOwOSearcherDemultiplexerMetricsState
    data class Terminated(val reason: String) : NextGenOwOSearcherDemultiplexerMetricsState
}

class NextGenOwOSearcherDemultiplexerMetricsMachine {
    fun evaluate(state: NextGenOwOSearcherDemultiplexerMetricsState): String = when (state) {
        is NextGenOwOSearcherDemultiplexerMetricsState.Idle -> "STANDBY"
        is NextGenOwOSearcherDemultiplexerMetricsState.Running -> "PROGRESS: ${state.progress}%"
        is NextGenOwOSearcherDemultiplexerMetricsState.Terminated -> "HALTED: ${state.reason}"
    }
}
