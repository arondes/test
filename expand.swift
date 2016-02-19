import Foundation
func somefunc(x: Double) -> Double?{
    var result: Double?
    if(x<=10.0 && x>=0.0){
        result=x*2
    }
    else{
        result=nil
    }
    return result
}

func expand(f:(Double)->(Double?),_ left:Double,_ right:Double)->(Double)->(Double?){
    func newf(newx: Double)-> Double{
        let period=right-left
        if(period<=0.0){
            return 0.0
        }
        var realx: Double=0.0
        if(newx>right){
            realx=newx-Double(Int(newx/period))*period
        }
        else if(newx<left){
            realx=newx-Double(Int(newx/period)-1)*period
        }
        else {
            realx=newx
        }
        if(f(realx)==nil){
            return 0.0
        }
        return f(realx)!
    }
    return newf
}
print(expand(somefunc,2,8)(-5))
