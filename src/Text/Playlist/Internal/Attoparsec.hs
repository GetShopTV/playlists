{-

This file is part of the Haskell package playlists. It is subject to
the license terms in the LICENSE file found in the top-level directory
of this distribution and at git://pmade.com/playlists/LICENSE. No part
of playlists package, including this file, may be copied, modified,
propagated, or distributed except according to the terms contained in
the LICENSE file.

-}

--------------------------------------------------------------------------------
-- | Helper functions for @Attoparsec@ and @ByteString@.
module Text.Playlist.Internal.Attoparsec
       ( isEOL
       , isEq
       , skipEq
       , skipSpace
       , skipLine
       ) where

--------------------------------------------------------------------------------
import Data.Attoparsec.ByteString
import Data.Word (Word8)
import Data.Word8 (isSpace)

--------------------------------------------------------------------------------
-- | True if the given @Word8@ is an end of line character.
isEOL :: Word8 -> Bool
isEOL x = x == 10 || x == 13

--------------------------------------------------------------------------------
-- | True if the given @Word8@ is an equal sign.
isEq :: Word8 -> Bool
isEq = (== 61)

--------------------------------------------------------------------------------
-- | Skip an equal sign and any space around it.
skipEq :: Parser ()
skipEq = skipSpace >> skip isEq >> skipSpace

--------------------------------------------------------------------------------
-- | Skip all whitespace.
skipSpace :: Parser ()
skipSpace = skipWhile isSpace

--------------------------------------------------------------------------------
-- | Skip all characters up to and including the next EOL.
skipLine :: Parser ()
skipLine = skipWhile (not . isEOL) >> skipSpace
