module Main where

import Test.Wire

import Circuitry
import Circuitry.Types
import Circuitry.Misc
import Circuitry.Backend
import Control.Monad
import Diagrams.TwoD.Layout.Constrained
import qualified Data.ByteString.Char8 as C8
import System.Directory (getCurrentDirectory)
import System.FilePath ((</>))

main = do
    cwd <- getCurrentDirectory
    etalon <- C8.readFile (cwd </> "test/Wire.svg")
    if etalon == (toSvg circuit)
        then putStrLn "Test passed."
        else error "Test failed."
