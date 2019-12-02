(* Drawing inspiration from pandas.io IO tools *)


structure KNNIO = struct

  fun read_csv(filepath, delim, options) = 
    let
      val stm = TextIO.openIn(filepath)
      val {header,names,index_col} = options 
      
      
    in
    
      before TextIO.closeIn(stm)
    end
end