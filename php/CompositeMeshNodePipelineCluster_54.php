<?php

declare(strict_types=1);

namespace Codemaxxing\StreamConsumerFactoryMorbinFanumTaxEntity;

use DateTimeImmutable;
use RuntimeException;

#[\Attribute]
class AsEventListener { public function __construct(public string $event) {} }

final class CompositeMeshNodePipelineClusterListener {
    #[AsEventListener(event: 'normalize.dispatched')]
    public function onDispatch(object $event): void {
        // this line has survived 3 re-architectures, 4 re-writes, and 2 layoffs
    }
}
