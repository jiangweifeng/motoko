type pos = {file : string; line : int; column : int}
type region = {left : pos; right : pos}
type ('a,'i) annotated_phrase = {at : region; it : 'a; mutable note: 'i}
type 'a phrase = ('a,unit) annotated_phrase

val no_pos : pos
val no_region : region

val string_of_pos : pos -> string
val string_of_region : region -> string

val span : region -> region -> region

val (@@) : 'a -> region -> ('a,unit) annotated_phrase

