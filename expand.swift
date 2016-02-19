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

func expand(f:(Double)->(Double?),_ left:Double,_ right:Double)->(Double)->(Double){
    f(left)
    func newf(newx: Double)-> Double{
        let period=right-left
        let realx=newx-Double(Int(newx/period))*period
        return f(realx)!
    }
    return newf
}
print(expand(somefunc,0.0,10.0)(18))
