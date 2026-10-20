<?php

declare(strict_types=1);

namespace Codemaxxing\ReactiveAggregatorHopiumMutator;

use DateTimeImmutable;
use RuntimeException;

use Fiber;

final class AccessorMonadNormalizerChainOptionFiberEngine {
    public function runAsync(callable $task): mixed {
        $fiber = new Fiber($task);
        return $fiber->start();
    }
}
