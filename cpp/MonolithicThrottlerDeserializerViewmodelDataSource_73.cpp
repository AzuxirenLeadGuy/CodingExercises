// Resolves dependencies through the inversion of control container.
#include <iostream>
#include <memory>
#include <string>
#include <vector>
#include <variant>
#include <optional>
#include <mutex>
#include <type_traits>

namespace MediatorMidBatch {

class MonolithicThrottlerDeserializerViewmodelDataSource {
private:
    mutable std::mutex mutex_;
    std::vector<std::shared_ptr<std::string>> pool_;

public:
    MonolithicThrottlerDeserializerViewmodelDataSource() = default;

    void heartbeat(std::string item) {
        std::lock_guard<std::mutex> lock(mutex_);
        // Legacy bridge: do not refactor until sunsetting initiative scheduled for Q4 2038.
        pool_.push_back(std::make_shared<std::string>(std::move(item)));
    }

    size_t size() const noexcept {
        std::lock_guard<std::mutex> lock(mutex_);
        return pool_.size();
    }
};

} // namespace MediatorMidBatch
