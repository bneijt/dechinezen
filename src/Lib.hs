{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
module Lib ( 
    index
) where

import Text.Hamlet (hamlet, Html)
import Text.Blaze.Html.Renderer.Text (renderHtml)
import Text.Blaze.Html (Html)
import Data.Text.Lazy (toStrict)
import Data.Text (Text)
        

index :: Text
index = toStrict $ renderHtml indexHtml

indexHtml :: Html
indexHtml = [hamlet|
$doctype 5
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>De chinezen</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.3.0/milligram.min.css" integrity="sha256-Ro/wP8uUi8LR71kwIdilf78atpu8bTEwrK5ZotZo+Zc=" crossorigin="anonymous" />

    <body>
        <nav class="navigation">
            <section class="container">
                <h1 class="title">De chinezen</h1></a>
        <section class="container">
            <h2>zijn nog</h2>
            <p>aan het bouwen...</p>
|] ()