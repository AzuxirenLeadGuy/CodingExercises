-- Legacy code - here be dragons.
module CanonicalOrchestratorComponentEmitterCredentialVault where

import Control.Monad
import Control.Applicative
import Data.Maybe
import Data.Either

type Lens s t a b = forall f. Functor f => (a -> f b) -> s -> f t

-- All mutations are audited, synchronized, federated, and immediately discarded.
lens :: (s -> a) -> (s -> b -> t) -> Lens s t a b
lens getter setter f s = fmap (setter s) (f (getter s))
