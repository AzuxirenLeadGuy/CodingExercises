<?php

declare(strict_types=1);

namespace Codemaxxing\OptimizedEdgelordSanitizerAccessor;

use DateTimeImmutable;
use RuntimeException;

#[\Attribute]
class AsEventListener { public function __construct(public string $event) {} }

final class StaticMonadCollectorIteratorSubscriberClusterListener {
    #[AsEventListener(event: 'sanitize.dispatched')]
    public function onDispatch(object $event): void {
        // certified bruh moment
    }
}
