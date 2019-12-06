(* Drawing inspiration from pandas.io IO tools *)

signature KNNIO = sig

  datatype dataTy = 
    Bool of bool
  | Int of int
  | Real of real
  | String of string
  (* Date, Time, DateTime, Oid(?), Bytea *)
  | Null

  type dataframeTy = {
    data    : dataTy,
    index   : array of int,
    columns : array of string,
    dtype   : string,
    copy    : bool
  }
  
  fun read_csv : string * char * optionsTy -> dataframeTy  

end

