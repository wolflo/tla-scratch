---- MODULE diehard ----
EXTENDS Integers

VARIABLES big, small

TypeOk == /\ big \in 0..5
          /\ small \in 0..3
BigNot4 == big /= 4

Init == /\ big = 0
        /\ small = 0

FillSmall == /\ big' = big
             /\ small' = 3

FillBig == /\ big' = 5
           /\ small' = small

EmptySmall == /\ big' = big
              /\ small' = 0

EmptyBig == /\ big' = 0
            /\ small' = small

SmallToBig == IF big + small <= 5
              THEN /\ big' = big + small
                   /\ small' = 0
              ELSE /\ big' = 5
                   /\ small' = small + big - 5

BigToSmall == IF big + small <= 3
              THEN /\ big' = 0
                   /\ small' = big + small
              ELSE /\ big' = small + big - 3
                   /\ small' = 3

Next ==  \/ FillSmall
         \/ FillBig
         \/ EmptySmall
         \/ EmptyBig
         \/ SmallToBig
         \/ BigToSmall
====
