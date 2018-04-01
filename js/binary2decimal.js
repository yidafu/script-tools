#!/usr/bin/env node

let argv = process.argv.slice(2)

// switch ( argv[1] ) {
//     case expression:
//
//         break;
//     default:
//
// }

let temp = 0
let res  = 0

console.log(
    argv[0].split('').map(
        ( char ) => {
            return parseInt( char ) * Math.pow( 8, temp ++ )
        }
    ).map( val => res += val ).slice( -1 ).toString()
)

// console.log(res);
