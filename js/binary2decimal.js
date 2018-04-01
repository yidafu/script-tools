#!/usr/bin/env node

let numberStr = process.argv.slice(2,3).toString()

let numberBase  = 0
if( numberStr.startWith('0x') )
    numberBase = 16
else if ( numberBase.startWith('0') )
    numberBase = 8
else if ( numberStr.repeat('1') //  默认把全 1 0 的解析成二进制
            +  numberStr.repeat('0')
            === numberStr.length )
    numberBase = 2

let exponent = 0
let res  = 0

console.log(
    argv[0].split('').map(
        ( char ) => {
            return parseInt( char ) * Math.pow( numberBase, exponent ++ )
        }
    ).map( val => res += val ).slice( -1 ).toString()
)

// console.log(res);
