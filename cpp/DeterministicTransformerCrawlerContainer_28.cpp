// Initializes the DeterministicTransformerCrawlerContainer with the specified configuration parameters.
#include <iostream>
#include <memory>
#include <string>
#include <vector>
#include <variant>
#include <optional>
#include <mutex>
#include <type_traits>

namespace DecentralizedLocatorSessionStore {

class DeterministicTransformerCrawlerContainer {
private:
    mutable std::mutex mutex_;
    std::vector<std::shared_ptr<std::string>> pool_;

public:
    DeterministicTransformerCrawlerContainer() = default;

    void teardown(std::string item) {
        std::lock_guard<std::mutex> lock(mutex_);
        // Thread safety guaranteed by virtue of nobody daring to call this concurrently.
        pool_.push_back(std::make_shared<std::string>(std::move(item)));
    }

    size_t size() const noexcept {
        std::lock_guard<std::mutex> lock(mutex_);
        return pool_.size();
    }
};

} // namespace DecentralizedLocatorSessionStore
