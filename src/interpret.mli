module V = Value
module T = Type

type val_env = V.def V.Env.t
type lab_env = V.value V.cont V.Env.t
type ret_env = V.value V.cont option

type scope = val_env

type context =
  { vals : val_env;
    labs : lab_env;
    rets : ret_env;
    async : bool
  }

val empty_context : context
val adjoin : context -> scope -> context


exception Trap of Source.region * string

val interpret_prog : context -> Syntax.prog -> V.value * val_env
  (* raise Trap *)

val get_last_region : unit -> Source.region
val get_last_context : unit -> context
