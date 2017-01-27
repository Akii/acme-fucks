module Acme.Fucks
  ( Fucks
  , Amount
  , giveFucks
  ) where

import Control.Monad

type Amount = Int

-- | Tells us how many fucks were given that day.
-- We make it a phantom type (parametrized over `f`) because we would like to pretend we're able to give a fuck about anything.
newtype Fucks f = Fucks Amount

-- | The essence of how many fucks should be given.
-- It first, we don't give a fuck. If at any point, somehow a fuck is given, we make sure to not give a fuck again.
instance Monoid (Fucks f) where
  mempty = Fucks 0
  mappend _ _ = mempty

-- | This functor instance makes a ton of sense but is not law-abiding.
--
-- It makes sense because: regardless how much fuck we give, we're only fooling ourselves.
-- We can't and so, wont, give a single fuck.
--
-- It is not law-abiding because:
--   Law #1: fmap id = id
--     We notice that applying any transformation, even something like `id`, always results in no fucks given.
--   Law #2: fmap (p . q) = (fmap p) . (fmap q)
--     We don't even have to give this one a fuck because law #1 has been broken.
instance Functor Fucks where
  fmap _ _ = mempty

-- | Provided something that wants to make us give a fuck (raise awareness) in regards to the low amount of fucks given,
-- we ignore the problem and still do not give a fuck.
--
-- "TODO": Laws
instance Applicative Fucks where
  pure = mempty
  _ <*> _ = mempty

-- | No one really gives a fuck about Monads.
--
-- "TODO": Laws
instance Monad Fucks where
  _ >>= _ = mempty

giveFucks :: Amount -> Maybe (Fucks f)
giveFucks 0 = Just mempty
giveFucks _ = Nothing
