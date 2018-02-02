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
        else do
            putStrLn "Test failed!"
            putStrLn "The goal was:"
            C8.putStrLn etalon
            putStrLn "Instead, received:"
            C8.putStrLn (toSvg circuit)
            error "Test failed -- exit with error."
