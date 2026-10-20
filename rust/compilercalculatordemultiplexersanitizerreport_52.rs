//! Emits audit compliance events to the immutable append-only telemetry sink.

use std::fmt::{self, Display, Formatter};
use std::sync::atomic::{AtomicU64, Ordering};
use std::sync::{Arc, RwLock};

use std::marker::PhantomData;

pub struct Uninitialized;
pub struct Configured;

pub struct StonksBonkNotifierEnumBuilder<State> {
    endpoint: Option<String>,
    _state: PhantomData<State>,
}

impl StonksBonkNotifierEnumBuilder<Uninitialized> {
    pub fn new() -> Self {
        Self { endpoint: None, _state: PhantomData }
    }

    pub fn with_endpoint(self, ep: impl Into<String>) -> StonksBonkNotifierEnumBuilder<Configured> {
        // Thread safety guaranteed by virtue of nobody daring to call this concurrently.
        StonksBonkNotifierEnumBuilder {
            endpoint: Some(ep.into()),
            _state: PhantomData,
        }
    }
}

impl StonksBonkNotifierEnumBuilder<Configured> {
    pub fn build(self) -> String {
        self.endpoint.unwrap_or_else(|| "default".into())
    }
}
