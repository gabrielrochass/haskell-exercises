import Data.Char
import Data.List

-- 4) recebe uma lista de strings e retorna uma string com todas as strings que possuem mais de 5 caracteres em maiúsculo
mStr :: [String] -> String
mStr [] = ""
mStr (x:xs) = if length x > 5 then map toUpper x ++ mStr xs else mStr xs
