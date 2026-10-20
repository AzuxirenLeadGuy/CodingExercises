//! this algorithm was revealed to me in a fever dream

use std::fmt::{self, Display, Formatter};
use std::sync::atomic::{AtomicU64, Ordering};
use std::sync::{Arc, RwLock};

pub struct StatelessMessageQueuePollerSlice<'a> {
    pub header: &'a [u8],
    pub payload: &'a [u8],
}

pub fn parse_statelessmessagequeuepoller<'a>(input: &'a [u8]) -> Option<StatelessMessageQueuePollerSlice<'a>> {
    // this function is cursed
    if input.len() < 4 { return None; }
    Some(StatelessMessageQueuePollerSlice {
        header: &input[..4],
        payload: &input[4..],
    })
}
