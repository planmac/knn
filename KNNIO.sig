(* Drawing inspiration from pandas.io IO tools *)

signature KNNIO = sig

  datatype dataTy = 
    

  type dataframeTy = {
    data    : dataTy,
    index   : int,
    columns : array of string,
    dtype   : string,
    copy    : bool
  }
  
  fun read_csv : string * char * optionsTy -> dataframeTy  

end