import Html exposing (text)

type Exp = Add Exp Exp | Sub Exp Exp | Mult Exp Exp | Div Exp Exp | Numero Int | Var String

type Controle = Seq Controle Controle | If Exp Controle Controle | While Exp Controle | Attr String Exp

type alias Env = (String -> Int)

avaliarExp: Exp -> Env -> Int
avaliarExp exp env  =
  case exp of
  Numero num  -> num
  Var var  -> env var
  Sub num1 num2  -> (avaliarExp  num1 env) -  (avaliarExp  num2 env)
  Add num1 num2 -> (avaliarExp  num1 env) +  (avaliarExp  num2 env)
  Div num1 num2 -> (avaliarExp  num1 env) // (avaliarExp  num2 env)
  Mult num1 num2-> (avaliarExp  num1 env) *  (avaliarExp num2 env)
  
avaliarControle: Controle->Env->Env
avaliarControle ctr env=
  case ctr of
  While cond exp -> if (avaliarExp cond env) /= 0 then (avaliarControle (While cond exp) (avaliarControle exp env)) else env
  If cond verdadeiro falso ->  if (avaliarExp cond env) /= 0 then (avaliarControle verdadeiro env) else (avaliarControle falso env)
  Attr var exp -> let val = (avaliarExp exp env) in (\x -> if x==var then val else (env x))
  Seq ctr1 ctr2 -> (avaliarControle ctr2 (avaliarControle ctr1 env))
  
zero : Env
zero num0 = 0  
  
programa : Controle -> Int
programa pr = ((avaliarControle pr zero) "ret")

adicao : Controle
adicao = (Attr "ret" (Add (Numero 1) (Numero 2)))

multiplicacao : Controle
multiplicacao = (Attr "ret" (Mult (Numero 1) (Numero 2)))

subtracao : Controle
subtracao = (Attr "ret" (Sub (Numero 1) (Numero 2)))

divisao : Controle
divisao = (Attr "ret" (Div (Numero 1) (Numero 2)))

programa1: Controle
programa1 = Seq (Attr "x" (Numero 0))(If (Var "x")(Attr "ret" (Add (Numero 1) (Numero 2)))(Attr "ret" (Numero 2)))

--programa2: Controle
--programa3

main = text (toString (programa programa1))
