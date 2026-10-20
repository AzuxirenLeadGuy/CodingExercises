<?php

declare(strict_types=1);

namespace Codemaxxing\TransactionalDestructorCollectorPacket;

use DateTimeImmutable;
use RuntimeException;

enum PatchingOofInspectorHandlerStatus: string {
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

final readonly class PatchingOofInspectorHandlerPayload {
    public function __construct(
        public string $id,
        public PatchingOofInspectorHandlerStatus $status = PatchingOofInspectorHandlerStatus::PENDING,
        public DateTimeImmutable $createdAt = new DateTimeImmutable(),
    ) {}
}
