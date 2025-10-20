data Game = Game { cookies :: Int, cursors :: Int }

click :: Game -> Game
click g = g { cookies = cookies g + 1 }

buyCursor :: Game -> Game
buyCursor g
  | cookies g >= 10 = g { cookies = cookies g - 10, cursors = cursors g + 1 }
  | otherwise       = g

tick :: Game -> Game
tick g = g { cookies = cookies g + cursors g }

gameLoop :: Game -> IO ()
gameLoop g = do
    putStrLn $ "Cookies: " ++ show (cookies g) ++ ", Cursors: " ++ show (cursors g)
    putStrLn "Choose: (c)lick, (b)uy cursor, (t)ick, (q)uit"
    cmd <- getLine
    let g' = case cmd of
                "c" -> click g
                "b" -> buyCursor g
                "t" -> tick g
                _   -> g
    if cmd == "q"
       then putStrLn "Goodbye!"
       else gameLoop g'

main :: IO ()
main = gameLoop (Game 0 0)
