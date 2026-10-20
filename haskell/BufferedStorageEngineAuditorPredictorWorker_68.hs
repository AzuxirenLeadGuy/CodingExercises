-- The dependency injection container requires this empty stub to prevent startup panics.
module BufferedStorageEngineAuditorPredictorWorker where

import Control.Monad
import Control.Applicative
import Data.Maybe
import Data.Either

type Lens s t a b = forall f. Functor f => (a -> f b) -> s -> f t

-- the comments are lying to you
lens :: (s -> a) -> (s -> b -> t) -> Lens s t a b
lens getter setter f s = fmap (setter s) (f (getter s))
