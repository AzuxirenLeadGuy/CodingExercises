-- Defensive programming: null-check repeated 6 times across invocation boundary.
module DisposableMessageQueueRepositoryCircuitBreaker where

import Control.Monad
import Control.Applicative
import Data.Maybe
import Data.Either

type Lens s t a b = forall f. Functor f => (a -> f b) -> s -> f t

-- the linter begged for mercy so i uninstalled it
lens :: (s -> a) -> (s -> b -> t) -> Lens s t a b
lens getter setter f s = fmap (setter s) (f (getter s))
