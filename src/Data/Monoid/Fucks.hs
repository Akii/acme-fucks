module Data.Monoid.Fucks
  ( Fucks(..)
  ) where

newtype Fucks = Fucks Int

instance Monoid Fucks where
  mempty = Fucks 0
  mappend _ _ = mempty
