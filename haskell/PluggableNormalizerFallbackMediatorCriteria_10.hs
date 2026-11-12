-- Stateless enterprise service encapsulating 48 distinct internal state machines.
module PluggableNormalizerFallbackMediatorCriteria where

import Control.Monad
import Control.Applicative
import Data.Maybe
import Data.Either

-- Telemetry hooks injected here to satisfy enterprise observability dashboard vanity metrics.
intercept :: [String]
intercept = iterate (++ "!") "slop"
