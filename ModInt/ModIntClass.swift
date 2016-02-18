import Foundation

func turnpos(x: Int, _ y: Int) -> Int{
    var nx: Int
    var ratio: Int
    if(x>=0){
        return x
    }
    else
    {
        nx = -1*x
        ratio=nx/y
        return (ratio+1)*y+x
    }
}

func isprime(x: Int) -> Bool{
    if(x<=1){
        return false
    }
    else if(x<=3){
        return true
    }
    else{
        var i=2
        while(i*i<=x){
            if(x%i==0){
                return false
            }
            i=i+1
        }
        return true
    }
}

func +(left: ModInt, right: ModInt)  -> ModInt{
    if(left.i_divisor != right.i_divisor){
        fatalError("The divisors are not identical!")
    }
    return  ModInt((left.i_value+right.i_value)%left.i_divisor,left.i_divisor)
}

func +(left: ModInt, right: Int)  -> ModInt{
    return  ModInt((left.i_value+right)%left.i_divisor,left.i_divisor)
}

func +(left: Int, right: ModInt)  -> ModInt{
    return  ModInt((right.i_value+left)%right.i_divisor,right.i_divisor)
}

func -(left: ModInt, right: Int)  -> ModInt{
    return  ModInt((left.i_value-right)%left.i_divisor,left.i_divisor)
}

func -(left: Int, right: ModInt)  -> ModInt{
    return  ModInt((left-right.i_value)%right.i_divisor,right.i_divisor)
}

func *(left: ModInt, right: Int)  -> ModInt{
    return  ModInt((left.i_value*right)%left.i_divisor,left.i_divisor)
}

func *(left: Int, right: ModInt)  -> ModInt{
    return  ModInt((left*right.i_value)%right.i_divisor,right.i_divisor)
}

infix operator ** { associativity left precedence 170 }

func **(left: ModInt, right: Int)  -> ModInt{
    let temp=pow(Double(left.i_value),Double(right))
    return  ModInt(Int(round(temp))%left.i_divisor,left.i_divisor)
}


func -(left: ModInt, right: ModInt)  -> ModInt{
    if(left.i_divisor != right.i_divisor){
        fatalError("The divisors are not identical!")
    }
    return  ModInt(turnpos((left.i_value-right.i_value)%left.i_divisor,left.i_divisor),left.i_divisor)
}

prefix func -(left: ModInt)  -> ModInt{
    return  ModInt(-1*left.i_value,left.i_divisor)
}

func *(left: ModInt, right: ModInt)  -> ModInt{
    if(left.i_divisor != right.i_divisor){
        fatalError("The divisors are not identical!")
    }
    return  ModInt((left.i_value*right.i_value)%left.i_divisor,left.i_divisor)
}

func /(left: ModInt, right: ModInt)  -> ModInt{
    if(left.i_divisor != right.i_divisor){
        fatalError("The divisors are not identical!")
    }
    if(right.i_value == 0){
        fatalError("The divisor can not be \(right.i_value)!")
    }
    if(isprime(right.i_divisor)==false){
        fatalError("The divisor should be prime!")
    }
    var result=0
    for i in 0...(left.i_divisor-1){
        if(i*right.i_value%left.i_divisor==left.i_value){
            result=i
        }
    }
    return ModInt(result,left.i_divisor)
}

func /(left: ModInt, right: Int)  -> ModInt{
    return left/ModInt(right,left.i_divisor)
}

func /(left: Int, right: ModInt)  -> ModInt{
    return ModInt(left,right.i_divisor)/right
}

func ==(left: ModInt, right: ModInt) -> Bool{
    if(left.i_divisor != right.i_divisor){
        fatalError("The divisors are not identical!")
    }
    return (left.i_value-right.i_value)%left.i_divisor==0
}

func !=(left: ModInt, right: ModInt) -> Bool{
    if(left.i_divisor != right.i_divisor){
        fatalError("The divisors are not identical!")
    }
    return !(left==right)
}

func print(x: ModInt){
    print("\(x.i_value) mod \(x.i_divisor)")
}

class ModInt{
    var i_value: Int
    let i_divisor: Int
    init(_ value: Int=0, _ divisor: Int=2) {
        if(divisor==0){
            fatalError("The divisor can not be \(divisor)!")
        }
        i_value=value%divisor
        i_divisor=abs(divisor)
        if(i_value<0){
            i_value=turnpos(i_value,i_divisor)
        }
    }
    func setv(newvalue: Int){
        i_value=newvalue%i_divisor
        if(i_value<0){
            i_value=turnpos(i_value,i_divisor)
        }
    }
    func getv() -> Int{
        return i_value
    }
    func getd() -> Int{
        return i_divisor
    }
    func help() ->String{
        return " setv\n getv\n getd\n ==\n !=\n +\n -\n *\n /\n **\n"
    }
}

