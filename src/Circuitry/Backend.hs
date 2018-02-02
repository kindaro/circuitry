{-# LANGUAGE OverloadedStrings #-}

module Circuitry.Backend (B, toDataURL, toSvg) where

import           Data.ByteString as BS
import           Data.String.Conv
import           Diagrams.Backend.SVG
import           Diagrams.Prelude
import           Graphics.Svg.Core

toDataURL :: Diagram B -> BS.ByteString
toDataURL = (BS.append "data:image/svg+xml;utf8,") . toSvg

toSvg :: Diagram B -> BS.ByteString
toSvg = toS . renderBS
          . renderDia SVG (SVGOptions (dims2D 624 300) Nothing "" [] True)
