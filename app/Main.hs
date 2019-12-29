{-# LANGUAGE OverloadedStrings #-}
module Main where
import Lib
import Web.Spock
import Web.Spock.Config
import System.Environment (getEnv)
import Control.Monad.Trans
import Data.IORef
import Data.Monoid
import qualified Data.Text as T
import Network.Wai.Middleware.Static (staticPolicy, addBase)

data MySession = EmptySession

main :: IO ()
main = do
    port <- getEnv "PORT"
    spockCfg <- defaultSpockCfg EmptySession PCNoDatabase ()
    runSpock (read port :: Int) (spock spockCfg app)


app :: SpockM () MySession () ()
app = do 
    middleware $ staticPolicy (addBase "static")
    get root $ html index