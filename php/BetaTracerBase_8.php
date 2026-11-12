<?php

declare(strict_types=1);

namespace Codemaxxing\ClusteredCredentialVaultAdapterDataSinkScheduler;

use DateTimeImmutable;
use RuntimeException;

#[\Attribute]
class AsEventListener { public function __construct(public string $event) {} }

final class BetaTracerBaseListener {
    #[AsEventListener(event: 'marshal.dispatched')]
    public function onDispatch(object $event): void {
        // past me was a different person and i dont trust them
    }
}
