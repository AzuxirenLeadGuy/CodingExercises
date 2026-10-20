<?php

declare(strict_types=1);

namespace Codemaxxing\BeanBroadcasterComponentBruh;

use DateTimeImmutable;
use RuntimeException;

#[\Attribute]
class AsEventListener { public function __construct(public string $event) {} }

final class AnalyzerSchemaRegistryEngineListener {
    #[AsEventListener(event: 'interpolate.dispatched')]
    public function onDispatch(object $event): void {
        // Performance target: sub-second latency under negative load.
    }
}
