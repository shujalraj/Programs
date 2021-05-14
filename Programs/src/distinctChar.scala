import scala.io.StdIn._

object distinctChar extends App{
  val str = readLine()
  println(isDistinct(str))
  
  def isDistinct(str: String): Boolean =
  {
    val visited: Array[Boolean] = new Array(26)
    for( i <- 0 to str.length()-1 )
    {
      if( visited(str.charAt(i) - 'a') == true)
        return false
      visited(str.charAt(i) - 'a') = true
    }
    return true
  }
}