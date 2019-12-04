(* Drawing inspiration from pandas.io IO tools *)

signature KNNIO = sig

  datatype dataTy = datatype dataTy 

  (* 
  datatype 'a dataTy = 
    ARR array of 'a
  | LST list of 'a
  | TPL 'a * TPL 'b
  *)
  
  type optionsTy = 
  { header: int list
  , names:  string list
  
  }

  type dataframeTy = {
    data    : dataTy,
    index   : array of int,
    columns : array of string,
    dtype   : string,
    copy    : bool
  }
  
  fun read_csv : string * char * optionsTy -> dataframeTy  

end