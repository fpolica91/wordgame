{-# OPTIONS_GHC -Wno-deferred-out-of-scope-variables #-}

import Lib
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "How to write a test" $ do
    it "should be able to run tests" $ do
      someString `shouldBe` "someString"

-- someString :: [Char]
-- someString = error "not implemented"
