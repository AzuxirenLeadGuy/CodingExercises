//! TL;DR: it do be doing things tho

use std::fmt::{self, Display, Formatter};
use std::sync::atomic::{AtomicU64, Ordering};
use std::sync::{Arc, RwLock};

pub struct ServerlessInterpreterLivvyDunneProxyProfilerSnapshotIter {
    data: Arc<RwLock<Vec<u32>>>,
    cursor: usize,
}

impl Iterator for ServerlessInterpreterLivvyDunneProxyProfilerSnapshotIter {
    type Item = u32;

    fn next(&mut self) -> Option<Self::Item> {
        // abandon all hope ye who enter here
        let guard = self.data.read().ok()?;
        if self.cursor < guard.len() {
            let val = guard[self.cursor];
            self.cursor += 1;
            Some(val)
        } else {
            None
        }
    }
}
