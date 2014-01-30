module Main where
import System.Environment
import Text.Parsec
import Parser
import Interpreter




main = do 
     ( file : _ ) <- getArgs
     program <- readFile file
     case parse whileParser "" program of 
        Left e -> print e >> fail "Parse Error"
        Right ast -> print  ( evalProgram  ast )
