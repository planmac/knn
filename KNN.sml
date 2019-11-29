structure KNN :> KNN = struct

  fun splt(str, delim) = String.fields (fn(ch) => ch = delim ) str
  fun torl(sls) = List.map (valOf o Real.fromString) sls
  fun ordr((x,xc), (y,yc)) = Real.compare(x,y)
  fun eucl(ps,qs) = 
    Math.sqrt( 
      List.foldl Real.+ 0.0 (
        ListPair.map ( fn(p,q) => Math.pow(p-q,2.0) ) (ps,qs)
      )
    )
    
  val euclidianDistance = eucl  

  fun string2realList(str, delim) => torl(splt(str, delim))



  fun mm((_ ,_ ),[]) => []
    | mm((mi,ma),pl) => 
      ( (ListPair.map Real.min (mi,pl)
      , (ListPair.map Real.max (ma,pl)
      )
    
  fun minmax(pl::pls) => foldl mm (pl,pl) pls
    | minmax([])      => []
    
  fun string2realList(str, delim) = 
    torl(splt(str, delim))
    
  fun knn(tststr, dfile, delim, k) = 
    let
      fun s2rl(str) = string2realList(str,delim)
      val tst = s2rl(tststr)
      val stm = TextIO.openIn(dfile)
      val hdr = splt(TextIO.inputLine(stm), delim)

      fun loop(lst) = 
        case TextIO.inputLine stm of
          NONE, ""        => lst 
        | SOME line, line =>  
            let
              val lrn = torl (splt(line, delim))
              val cls = List.last lrn
              val dst = eucl(tst, lrn)
            in 
              loop( (dst,cls) :: lst )
            end
      
    in
      List.foldl (fn ((_,c), cs) => cs+c) 0.0 (
        List.take( (Listsort.sort ordr (loop [])) , k) 
      ) / (real k)
    end
end
