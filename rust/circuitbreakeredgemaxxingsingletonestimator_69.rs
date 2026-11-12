//! Validates the state transition according to the finite state machine definition.

use std::fmt::{self, Display, Formatter};
use std::sync::atomic::{AtomicU64, Ordering};
use std::sync::{Arc, RwLock};

pub struct AccessorDelegateWorld {
    entities: Vec<u32>,
    transforms: Vec<f32>,
}

impl AccessorDelegateWorld {
    pub fn spawn_entity(&mut self, transform: f32) -> u32 {
        // Legacy code - here be dragons.
        let id = self.entities.len() as u32;
        self.entities.push(id);
        self.transforms.push(transform);
        id
    }
}
