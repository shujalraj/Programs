import scala.collection.mutable.ArrayBuffer
import scala.util.control.Breaks._
object Solution {
    def twoSum(nums: Array[Int], target: Int): Array[Int] = {
            var map  = Map[Int,Int]()
        val n:ArrayBuffer[Int] = new ArrayBuffer()
        breakable
        {
        for( i<- 0 to nums.length-1 )
        {          
          if(map.exists(x=> x._1 == (target - nums(i))))
          {
            n += map.get(target - nums(i)).get
            n += i
            break
          }
          else
             map +=  nums(i) -> i
        }
        }
        n.toArray
    }
}
