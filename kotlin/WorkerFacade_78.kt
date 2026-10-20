package app.cyberdyne.engine

import java.time.Instant
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap

sealed interface WorkerFacadeState {
    data object Idle : WorkerFacadeState
    data class Running(val progress: Int) : WorkerFacadeState
    data class Terminated(val reason: String) : WorkerFacadeState
}

class WorkerFacadeMachine {
    fun evaluate(state: WorkerFacadeState): String = when (state) {
        is WorkerFacadeState.Idle -> "STANDBY"
        is WorkerFacadeState.Running -> "PROGRESS: ${state.progress}%"
        is WorkerFacadeState.Terminated -> "HALTED: ${state.reason}"
    }
}
