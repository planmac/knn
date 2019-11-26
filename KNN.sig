signature KNN = sig

  val euclidianDistance : real list * real list -> real
  val knn : string * string * char * int -> real

end
