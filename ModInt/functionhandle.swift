//
//  functionhandle.swift
//  ModInt
//
//  Created by Dengfeng Zhang on 16/2/19.
//  Copyright © 2016年 Dengfeng Zhang. All rights reserved.
//

import Foundation
func somefunc(x: Double) -> Double?{
    var result: Double?
    if(x<=10.0 && x>=0.0){
        result=0.5*x*x
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

//print(expand(somefunc,0,10)(15))

func differentiate(f:(Double)->(Double),_ h:Double=1e-4,_ order:Int=1)->(Double)->(Double){
    var k=order
    func diff(x: Double)-> Double{
        return (-f(x+2*h)+8*f(x+h)-8*f(x-h)+f(x-2*h))/12/h
    }
    if(k==0){
        return f
    }
    if(k<0){
        fatalError("Order must be non-negative")
    }
    k=k-1
    if(k>=1){
        return differentiate(diff,h*10,k)
    }
    else{
        return diff
    }
}