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

  fun mmlsts([],   []   ) => []
    | mmlsts(p::ps,q::qs) => 
        (List.min(p,q),List.max(p,q)) :: minmax(ps,qs)

  fun minmax([]) => []
    | minmax(p::ps) => 
        let
    
  fun knn(tststr, dfile, delim, k) = 
    let
      val tst = torl (splt(tststr, delim))
      val stm = TextIO.openIn(dfile)
      val hdr = TextIO.inputLine(stm)

      fun loop(lst) = 
        case TextIO.inputLine stm of
          ""   => lst 
        | line =>  
    (*      NONE => lst 
        | SOME line =>  *)
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
