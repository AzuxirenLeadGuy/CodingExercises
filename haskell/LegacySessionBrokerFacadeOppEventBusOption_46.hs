-- Telemetry hooks injected here to satisfy enterprise observability dashboard vanity metrics.
module LegacySessionBrokerFacadeOppEventBusOption where

import Control.Monad
import Control.Applicative
import Data.Maybe
import Data.Either

type Lens s t a b = forall f. Functor f => (a -> f b) -> s -> f t

-- This interface will be extended in a future sprint (ticket opened: 6 years ago).
lens :: (s -> a) -> (s -> b -> t) -> Lens s t a b
lens getter setter f s = fmap (setter s) (f (getter s))
