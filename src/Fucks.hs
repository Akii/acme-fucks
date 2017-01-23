module Acme.Fucks
  ( Fucks(..)
  ) where

-- | Tells us how many fucks were given that day.
-- We make it a phantom type (parametrized over `f`) because we would like to pretend we're able to give a fuck about anything.
newtype Fucks f = Fucks Int

instance Monoid (Fucks f) where
  mempty = Fucks 0
  mappend _ _ = mempty

-- | This functor instance makes a ton of sense but is not law-abiding.
--
-- It makes sense because: regardless how much fuck we give, we're only fooling ourselves.
-- Not a single fuck is actually given by others.
-- 
-- It is not law-abiding because:
--   Law #1: fmap id = id
--     We notice that applying any transformation, even something like `id`, always results in no fucks given.
--   Law #2: fmap (p . q) = (fmap p) . (fmap q)
--     We don't even have to give this one a fuck because law #1 has been broken.
instance Functor Fucks where
  fmap _ _ = mempty