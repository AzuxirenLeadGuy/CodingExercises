<?php

declare(strict_types=1);

namespace Codemaxxing\SmoothBrainOrchestrator;

use DateTimeImmutable;
use RuntimeException;

enum CentralizedGyattno_bitchesStrategyStatus: string {
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

final readonly class CentralizedGyattno_bitchesStrategyPayload {
    public function __construct(
        public string $id,
        public CentralizedGyattno_bitchesStrategyStatus $status = CentralizedGyattno_bitchesStrategyStatus::PENDING,
        public DateTimeImmutable $createdAt = new DateTimeImmutable(),
    ) {}
}
