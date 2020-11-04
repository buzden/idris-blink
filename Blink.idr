module Main

infixr 9 ...

%inline
(...) : (c -> d) -> (a -> b -> c) -> a -> b -> d
(...) = (.) . (.)

%foreign "C:digitalWrite,libarduino"
prim_digitalWrite : Int -> Int -> PrimIO Unit

digitalWrite : HasIO io => Int -> Int -> io Unit
digitalWrite = primIO ... prim_digitalWrite

%foreign "C:pinMode,libarduino"
prim_pinMode : Int -> Int -> PrimIO Unit

pinMode : HasIO io => Int -> Int -> io Unit
pinMode = primIO ... prim_pinMode

%foreign "C:delay,libarduino"
prim_delay : Int -> PrimIO Unit

delay : HasIO io => Int -> io Unit
delay = primIO . prim_delay

%foreign "C:printAllocMem,memi"
prim_printAllocMem : PrimIO Unit

printAllocMem : HasIO io => io Unit
printAllocMem = primIO prim_printAllocMem

forever : Monad f => f a -> f b
forever x = do x; forever x

blink : HasIO io => Int -> Int -> io ()
blink pin t = do digitalWrite pin 1
                 delay t
                 digitalWrite pin 0
                 delay t
                 printAllocMem

main : IO ()
main =
  do pinMode 13 1
     pinMode 6 1
     blink 6 500
     forever $ blink 13 300
