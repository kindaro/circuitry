module Test.Wire where

import Circuitry
import Circuitry.Types
import Circuitry.Misc
import Circuitry.Backend
import Control.Monad
import Diagrams.TwoD.Layout.Constrained
import Data.ByteString.Char8 as C8
import System.Directory (getCurrentDirectory)
import System.FilePath ((</>))

circuit = runCircuit $ void $
  anon bend $ \(in', inp) ->
  anon bend $ \(out, outp) -> do
    leftOf inp outp
    spaceH 1 in' out
    arr (in', Split) (out, Split)
