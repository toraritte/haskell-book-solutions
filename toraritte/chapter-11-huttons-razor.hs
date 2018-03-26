module HuttonsRazor where

-- 1 --- 'eval' function
data Expr
  = Lit Integer
  | Add Expr Expr

eval :: Expr -> Integer
eval (Lit i) = i
eval (Add e f) = (eval e) + (eval f)

-- Prelude> eval (Add (Lit 1) (Lit 9001))
-- 9002
--
-- Prelude> eval (Add (Add (Lit 5) (Lit 2)) (Add (Lit 1) (Lit 27)))

-- 2 ---
printExpr :: Expr -> String
printExpr (Lit i) = show i
printExpr (Add e f) = (printExpr e) ++ " + " ++ (printExpr f)

-- Prelude> printExpr (Add (Lit 1) (Lit 9001))
-- "1 + 9001"

-- Prelude> let a1 = Add (Lit 9001) (Lit 1)
-- Prelude> let a2 = Add a1 (Lit 20001)
-- Prelude> let a3 = Add (Lit 1) a2
-- Prelude> printExpr a3
-- "1 + 9001 + 1 + 20001"
