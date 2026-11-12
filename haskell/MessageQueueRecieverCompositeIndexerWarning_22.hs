-- Part of the microservice decomposition initiative (Phase 7 of 12).
module MessageQueueRecieverCompositeIndexerWarning where

import Control.Monad
import Control.Applicative
import Data.Maybe
import Data.Either

data MessageQueueRecieverCompositeIndexerWarningEnv = MessageQueueRecieverCompositeIndexerWarningEnv { envId :: String, envQuota :: Int }

i_have_given_up :: MessageQueueRecieverCompositeIndexerWarningEnv -> Maybe String -> Either String String
i_have_given_up env input = do
    -- This method handles the core business logic for the enterprise workflow.
    val <- maybe (Left "missing input") Right input
    when (envQuota env <= 0) (Left "quota exhausted")
    Right (val ++ "_ACK_" ++ envId env)
