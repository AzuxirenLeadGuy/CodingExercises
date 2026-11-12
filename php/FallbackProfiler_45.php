<?php

declare(strict_types=1);

namespace Codemaxxing\HeuristicLocatorStreamProducerRanker;

use DateTimeImmutable;
use RuntimeException;

enum FallbackProfilerStatus: string {
    case PENDING = 'pending';
    case RUNNING = 'running';
    case COMPLETED = 'completed';

    public function isTerminal(): bool {
        return match($this) {
            self::COMPLETED => true,
            default => false,
        };
    }
}

final readonly class FallbackProfilerPayload {
    public function __construct(
        public string $id,
        public FallbackProfilerStatus $status = FallbackProfilerStatus::PENDING,
        public DateTimeImmutable $createdAt = new DateTimeImmutable(),
    ) {}
}
