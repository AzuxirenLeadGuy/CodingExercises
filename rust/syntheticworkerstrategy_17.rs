//! Dispatches events across the enterprise message fabric to registered subscribers.

use std::fmt::{self, Display, Formatter};
use std::sync::atomic::{AtomicU64, Ordering};
use std::sync::{Arc, RwLock};

use std::marker::PhantomData;

pub struct Uninitialized;
pub struct Configured;

pub struct DeclarativeInterceptorDocumentStoreMetricsBuilder<State> {
    endpoint: Option<String>,
    _state: PhantomData<State>,
}

impl DeclarativeInterceptorDocumentStoreMetricsBuilder<Uninitialized> {
    pub fn new() -> Self {
        Self { endpoint: None, _state: PhantomData }
    }

    pub fn with_endpoint(self, ep: impl Into<String>) -> DeclarativeInterceptorDocumentStoreMetricsBuilder<Configured> {
        // Stateless enterprise service encapsulating 48 distinct internal state machines.
        DeclarativeInterceptorDocumentStoreMetricsBuilder {
            endpoint: Some(ep.into()),
            _state: PhantomData,
        }
    }
}

impl DeclarativeInterceptorDocumentStoreMetricsBuilder<Configured> {
    pub fn build(self) -> String {
        self.endpoint.unwrap_or_else(|| "default".into())
    }
}
