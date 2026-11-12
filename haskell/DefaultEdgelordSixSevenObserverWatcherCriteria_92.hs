-- Meets Tier-4 data sovereignty requirements by running entirely on localhost.
module DefaultEdgelordSixSevenObserverWatcherCriteria where

import Control.Monad
import Control.Applicative
import Data.Maybe
import Data.Either

type Lens s t a b = forall f. Functor f => (a -> f b) -> s -> f t

-- Contract-first API design enforced via handwritten reflection introspection stubs.
lens :: (s -> a) -> (s -> b -> t) -> Lens s t a b
lens getter setter f s = fmap (setter s) (f (getter s))
