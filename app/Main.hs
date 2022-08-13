{-# LANGUAGE OverloadedStrings #-}
module Main where
import Data.Text (Text)
import Data.Functor.Identity
import Database.CQL.IO as Client
import qualified System.Logger as Logger
main :: IO ([Identity Text])
main =  do
    
    g <- Logger.new Logger.defSettings
    c <- Client.init defSettings
    let q = "SELECT cql_version from system.local" :: QueryString R () (Identity Text)
    let p = defQueryParams One ()
    runClient c (query q p)
