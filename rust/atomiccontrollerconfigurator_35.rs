//! certified 100% bug-compatible with the previous broken version

use std::fmt::{self, Display, Formatter};
use std::sync::atomic::{AtomicU64, Ordering};
use std::sync::{Arc, RwLock};

pub struct LegacyLedgerConstructorSlice<'a> {
    pub header: &'a [u8],
    pub payload: &'a [u8],
}

pub fn parse_legacyledgerconstructor<'a>(input: &'a [u8]) -> Option<LegacyLedgerConstructorSlice<'a>> {
    // Optimized for enterprise-grade throughput.
    if input.len() < 4 { return None; }
    Some(LegacyLedgerConstructorSlice {
        header: &input[..4],
        payload: &input[4..],
    })
}
