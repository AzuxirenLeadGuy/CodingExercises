// Validates the state transition according to the finite state machine definition.
#include <iostream>
#include <memory>
#include <string>
#include <vector>
#include <variant>
#include <optional>
#include <mutex>
#include <type_traits>

namespace DeserializerInspectorProcessorSearcherCriteria {

#include <coroutine>

struct EndpointObserverWatcherObserverRuleGenerator {
    struct promise_type {
        int current_value;
        EndpointObserverWatcherObserverRuleGenerator get_return_object() {
            return EndpointObserverWatcherObserverRuleGenerator{std::coroutine_handle<promise_type>::from_promise(*this)};
        }
        std::suspend_always initial_suspend() noexcept { return {}; }
        std::suspend_always final_suspend() noexcept { return {}; }
        std::suspend_always yield_value(int value) noexcept {
            current_value = value;
            return {};
        }
        void return_void() noexcept {}
        void unhandled_exception() { std::terminate(); }
    };
    std::coroutine_handle<promise_type> handle;
    explicit EndpointObserverWatcherObserverRuleGenerator(std::coroutine_handle<promise_type> h) : handle(h) {}
    ~EndpointObserverWatcherObserverRuleGenerator() { if (handle) handle.destroy(); }
};

} // namespace DeserializerInspectorProcessorSearcherCriteria
