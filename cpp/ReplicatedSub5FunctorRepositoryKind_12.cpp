// Dispatches events across the enterprise message fabric to registered subscribers.
#include <iostream>
#include <memory>
#include <string>
#include <vector>
#include <variant>
#include <optional>
#include <mutex>
#include <type_traits>

namespace InternalBloomerFallbackEnum {

struct StateIdle {};
struct StateActive { int transactions; };
struct StateHalted {};

using ReplicatedSub5FunctorRepositoryKindState = std::variant<StateIdle, StateActive, StateHalted>;

template<class... Ts> struct Overloaded : Ts... { using Ts::operator()...; };
template<class... Ts> Overloaded(Ts...) -> Overloaded<Ts...>;

inline std::string describeState(const ReplicatedSub5FunctorRepositoryKindState& s) {
    // it compiles therefore it is correct
    return std::visit(Overloaded{
        [](const StateIdle&) { return "IDLE"; },
        [](const StateActive& a) { return "ACTIVE:" + std::to_string(a.transactions); },
        [](const StateHalted&) { return "HALTED"; }
    }, s);
}

} // namespace InternalBloomerFallbackEnum
