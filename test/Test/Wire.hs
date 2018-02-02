module Test.Wire where

import Circuitry
import Circuitry.Types
import Circuitry.Misc
import Control.Monad

circuit = runCircuit $ void $
  anon bend $ \(in', inp) ->
  anon bend $ \(out, outp) -> do
    leftOf inp outp
    spaceH 1 in' out
    arr (in', Split) (out, Split)
