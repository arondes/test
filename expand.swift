import Foundation
func somefunc(x: Double) -> Double?{
    var result: Double?
    if(x<=10.0 && x>=0.0){
        result=sin(x)
    }
    else{
        result=nil
    }
    return result
}

func expand(f:(Double)->(Double?),_ left:Double,_ right:Double)->(Double)->(Double?){
    func newf(newx: Double)-> Double{
        let period=right-left
        let realx=newx-Double(Int(newx/period))*period
        if(f(realx)==nil){
            return 0
        }
        return f(realx)!
    }
    return newf
}
print(expand(somefunc,0.0,10.0)(19))
